class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy] 
  before_action :redirect_to_index, only: [:edit, :update, :destroy]

  def index
    @schedules = Schedule.order("created_at DESC")
    @user = User.all
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


  private

  def schedule_params
      params.require(:schedule).permit(:client, :person, :content_id, :aim, :time,:product_id, :report, :other, :response_id, :start_time).merge(user_id: current_user.id)
  end

  def set_item
    @schedule = Schedule.find(params[:id])
  end

  def redirect_to_index
    @schedule = Schedule.find(params[:id])
    redirect_to root_path unless @schedule.user_id == current_user.id
  end
end
