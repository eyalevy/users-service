class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_user, only: %w[get update]
  before_action :check_auth, only: %w[get update]

  def index
    render :json => User.all
  end

  def get
    render :json => @user unless not @user.errors
  end

  def create
    @user = ::User.new.create(params)
    render :json => @user.as_json(:except => [:password,:token])
  end

  def update
    @user.update(params)
    render :json => @user.as_json(:except => [:password,:token])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_auth
    if (@user.token != cookies["token"])
      render :json => "unauthorized" , :status => :unauthorized
    end
  end
end
