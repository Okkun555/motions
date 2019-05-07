class LogsController < ApplicationController
  before_action :login_require

  def index
  end

  def show
  end

  def new
    @log = Log.new
  end

  def create
    @log = current_user.logs.build(logs_params)
    if @log.save
      flash[:success] = '投稿しました。'
      redirect_to logs_path(current_user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private
      def logs_params
        params.require(:log).permit(:training_day, :training_menu, :memo)
      end
end
