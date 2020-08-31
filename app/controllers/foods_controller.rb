class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_time
  before_action :find_food
  before_action :set_order

  def index; end

  private

  def find_time
    @weak_days = Food.weak_days
    @weak_dates = Food.weak_dates
  end

  def set_order
    @order = current_user.orders.first_or_create
    @order.add_food(@food)
  end

  def find_food
    @food = Food.find(params[:food_id]) if params[:food_id]
  end

  def food_params
    params.require(:food).permit(:title)
  end
end
