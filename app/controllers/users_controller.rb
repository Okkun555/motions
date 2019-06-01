class UsersController < ApplicationController
  before_action :login_require, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy, :setting, :update_email, :update_password]

  def show
    @user     = User.find(params[:id])
    @profile  = @user.profile
    @logs     = @user.logs.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params)
    if @user.save
      # ログインさせる
      session[:user_id] = @user.id
      flash[:success] = 'アカウントを作成しました。'
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # すでに画像がある場合は、現在の画像をデフォルトでセット
    @user.avatar.attach(params[:user][:avatar]) if params[:user][:avatar]
    if @user.update(user_update_params)
      flash[:success] = 'アカウントを更新しました。'
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'アカウントを削除しました。'
    redirect_to root_url
  end

  def setting
    @user = User.find(params[:id])
  end

  def email_update
    @user = User.find(params[:id])
    if @user.update(user_email_update_params)
      flash[:success] = 'メールアドレスを更新しました。'
      redirect_to user_url(@user)
    else
      render 'setting'
    end
  end

  def password_update
    @user = User.find(params[:id])
    # 現在のアドレスが一致しているのか照合
    if @user && @user.authenticate(params[:user][:old_password])
      if @user.update(user_password_update_params)
        flash[:success] = 'パスワードを更新しました。'
        redirect_to user_url(@user)
      else
        render 'setting'
      end
    else
      render 'setting'
    end
  end

  private
      def user_create_params
        params.require(:user).permit(:name,:email, :password, :password_confirmation)
      end

      def user_update_params
        params.require(:user).permit(:avatar, :name, profile_attributes: [:user_profile, :gim_training, :house_training,:weight_training, :bodyweight_training, :diet, :body_make, :power])
      end

      def user_email_update_params
        params.require(:user).permit(:email)
      end

      def user_password_update_params
        params.require(:user).permit(:password, :password_confirmation)
      end
end
