class UsersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'アカウントを作成しました。'
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def setting
  end

  def email_update
  end

  def password_update
  end

  private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
