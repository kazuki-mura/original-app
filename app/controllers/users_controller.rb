class UsersController < ApplicationController
  before_action :search_product, only: [:show, :search]

  def show
    @user = User.find(params[:id])
    @schedules = @user.schedules.includes(:user)
  end

  def search
    @schedules = @p.result.includes(:user).order("created_at DESC")
  end

  private

  def search_product
    @p = Schedule.ransack(params[:q])
  end

end
