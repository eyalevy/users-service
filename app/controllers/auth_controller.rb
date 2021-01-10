class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_user
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

  def check_auth
    if (@user.token != cookies["token"])
      render :json => "unauthorized", :status => :unauthorized
    end
  end

  def set_user
    email = params.fetch(:email)
    @user = User.find_by(email: email);
    if (@user.nil?)
      render :json => "unauthorized", :status => :unauthorized
    end
  end

  def set_cookie_token
    cookies["token"] = {
      value: @user.token,
      expires: 86400.seconds.from_now # 1 day expiration
    }
  end

  def remove_cookie_token
    cookies.delete("token")
  end
end
