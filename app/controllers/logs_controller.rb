class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  def index
    @logs = Log.order("date DESC").page(params[:page]).per(5)
  end

  def new
    @log = Log.new
  end

  def edit
  end

  def create
    if Log.create(log_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    #削除ボタンを押された写真のidを取ってきて、一つずつ削除する。
    unless params[:log][:image_ids].nil?
      params[:log][:image_ids].each do |image_id|
        image = @log.images.find(image_id)
        image.purge
      end
    end
    if @log.update(log_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @log.destroy
    redirect_to root_path
  end

  private
    def set_log
      @log = Log.find(params[:id])
    end

    def log_params
      params.require(:log).permit(:place, :date, :point, :member, :En, :Ex, :Dt, :Max, :Ave, :Cl, :Temp, :fish, images: []).merge(user_id: current_user.id)
    end
end
