class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user

  def sign_in
    render :json => User.all
  end

  def sign_out
    render :json => User.all
  end

end
