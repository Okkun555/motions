class LogsController < ApplicationController
  before_action :login_require
  before_action :correct_user_logs, only: [:edit, :update]

  def show
    @log = Log.find(params[:id])
    @menus = @log.menus
    @user = @log.user
  end

  def new
    @log = Log.new
    @log.menus.build
  end

  def create
    @log = current_user.logs.build(logs_params)
    if @log.save
      flash[:success] = '投稿しました。'
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @log = current_user.logs.find(params[:id])
  end

  def update
    @log = current_user.logs.find(params[:id])
    if @log.update(logs_params)
      flash[:success] = '更新しました。'
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  private
      def logs_params
        params.require(:log).permit(:training_day, :training_title, :comment, menus_attributes: [:training_event, :training_weight, :reps, :training_time, :distance, :log_id, :destroy])
      end

      def correct_user_logs
        @log = current_user.logs.find_by(id: params[:id])
        if @log.nil?
          flash[:danger] = '更新権限がありません'
          redirect_to root_path
        end
      end
end
