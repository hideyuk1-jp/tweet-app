class ApplicationController < ActionController::Base
  before_action :set_current_user

  # Postの1ページあたり表示件数
  POST_PER = 10
  # Userの1ページあたり表示件数
  USER_PER = 10
  # Commentの1ページあたり表示件数
  COMMENT_PER = 10

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です。"
      redirect_to("/login")
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています。"
      redirect_to("/posts/index")
    end
  end

  def get_userimage_src(user)
    userimage_src = Userimage.find_by(user_id: user.id)
    if userimage_src
      return "data:image/jpg;base64, #{user.userimage.picture}"
    else
      return "/user_images/default.jpg"
    end
  end

  helper_method :get_userimage_src
end
