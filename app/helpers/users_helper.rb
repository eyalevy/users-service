module UsersHelper

  def set_user_by_mail
    email = params.fetch(:email)
    @user = User.find_by(email: email);
    if (@user.nil?)
      render :json => "unauthorized", :status => :unauthorized
    end
  end

  def set_user_by_id
    @user = User.find(params[:id])
  end
end
