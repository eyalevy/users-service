module AuthHelper
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
