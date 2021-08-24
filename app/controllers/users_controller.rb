class UsersController < ApplicationController
  before_action :search_product, only: [:show, :search]
  before_action :set_product_column, only: [:show, :search]

  def show
    @user = User.find(params[:id])
    @users = User.all
    @schedules = @user.schedules.includes(:user).order("created_at DESC")
  end

  def search
    @schedules = @p.result.includes(:user).order("created_at DESC")
  end

  private

  def search_product
    @p = Schedule.ransack(params[:q])
  end

  def set_product_column
    @schedule_search = Schedule.select("user_id").distinct
  end
end
