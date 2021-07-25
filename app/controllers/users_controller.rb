class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @schedules = @user.schedules.includes(:user)

  end

end
