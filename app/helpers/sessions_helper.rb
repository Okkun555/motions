module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_require
    redirect_to login_path unless current_user
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = '更新権限がありません'
      redirect_to root_path
    end
  end
end
