class AuthController < ApplicationController
  include AuthHelper
  include UsersHelper
  skip_before_action :verify_authenticity_token

  before_action :set_user_by_mail
  before_action :check_auth, only: %w[sign_out]

  def sign_in
    @user.sign_in(params.fetch(:password))
    set_cookie_token
    render :json => @user.as_json(:except => [:token, :password])

    rescue AuthorizationError
      render :json => "unauthorized", :status => :unauthorized
  end

  def sign_out
    @user.remove_token
    remove_cookie_token
    render :json => "logged out"
  end

  private

  def check_auth
    if (@user.token != cookies["token"])
      render :json => "unauthorized", :status => :unauthorized
    end
  end
end
