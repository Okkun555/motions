class UsersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params)
    if @user.save
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
  end

  def email_update
  end

  def password_update
  end

  private
      def user_create_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      def user_update_params
        params.require(:user).permit(:name, :profile)
      end
end
