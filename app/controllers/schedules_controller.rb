class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy] 
  before_action :redirect_to_index, only: [:edit, :update, :destroy]
  before_action :search_product, only: [:index, :show, :search]


  def index
    @schedules = Schedule.includes(:user).order("visit_date DESC")
    @users = User.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

 def show
 end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule.id)
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to root_path
  end

  def search
    @schedules = @p.result.includes(:user).order("visit_date DESC")
  end


  private

  def schedule_params
      params.require(:schedule).permit(:client, :person, :content_id, :aim, :starting_time,:ending_time,:product_id, :report, :other, :start_time, :visit_date).merge(user_id: current_user.id)
  end

  def set_item
    @schedule = Schedule.find(params[:id])
  end

  def redirect_to_index
    @schedule = Schedule.find(params[:id])
    redirect_to root_path unless @schedule.user_id == current_user.id
  end

  def search_product
    @p = Schedule.ransack(params[:q])
  end
end
