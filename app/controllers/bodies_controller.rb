class BodiesController < ApplicationController
  before_action :login_require
  # before_action :correct_user_bodies

  def index
    @bodies = current_user.bodies
  end

  def new
    @body = Body.new
  end

  def create
    @body = current_user.bodies.build(body_params)
    if @body.save
      flash[:success] = '記録しました。'
      redirect_to bodies_path
    else
      render 'new'
    end
  end

  private
      def body_params
        params.require(:body).permit(:date, :length, :weight, :fat_percentage)
      end

      # def correct_user_bodies
      #   @body = current_user.bodies.find_by(id: params[:id])
      #   if @body.nil?
      #     flash[:danger] = '更新権限がありません'
      #     redirect_to root_path
      #   end
      # end
end
