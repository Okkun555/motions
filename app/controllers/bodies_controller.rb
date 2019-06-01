class BodiesController < ApplicationController
  before_action :login_require

  def index
    @bodies = current_user.bodies
  end

  def weight_show
    #配列をJavascript用に変換
    @bodies_date    = current_user.bodies.pluck(:date).last(7).to_json.html_safe
    @bodies_weight  = current_user.bodies.pluck(:weight).last(7).to_json.html_safe
  end

  def fat_percentage_show
    @bodies_date    = current_user.bodies.pluck(:date).last(7).to_json.html_safe
    @bodies_fat_per = current_user.bodies.pluck(:fat_percentage).to_json.html_safe
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
end
