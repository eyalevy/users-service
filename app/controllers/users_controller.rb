class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render :json => User.all
  end

  def get
    user = User.find(params[:id])
    render :json => user unless not user.errors
  end

  def create
    user = ::User.new.register(params)
    render :json => user.as_json(:except => [:password,:token])
  end

  def update
    render :json => User.all
  end

  def sign_in
    render :json => User.all
  end

  def sign_out
    render :json => User.all
  end

end
