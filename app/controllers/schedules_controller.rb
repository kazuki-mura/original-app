class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end

  def new
    @Schedule = Schedule.new
  end

  def create
    Schedule.create(schedule_parameter)
    redirect_to schedules_path
  end

  private

  def schedule_parameter
    params.require(:schedule).permit(:client, :person, :content, :aim, :time, :report, :other, :resource).merge(user_id: current_user.id)
  end
end
