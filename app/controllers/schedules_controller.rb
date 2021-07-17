class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.order("created_at DESC")

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

  private


  def schedule_params
    params.require(:schedule).permit(:client, :person, :content_id, :aim, :time,:product_id, :report, :other, :response_id, :start_time).merge(user_id: current_user.id)
  end
end
