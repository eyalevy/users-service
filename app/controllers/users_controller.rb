class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: %w[get update]

  def index
    render :json => User.all
  end

  def get
    render :json => @user unless not @user.errors
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
  def set_user
    user_id = params.fetch(:id)
    @user = User.find(params[:id])
  end

end
