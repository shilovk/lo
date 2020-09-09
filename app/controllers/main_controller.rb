class MainController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @weak_days = Food.weak_days
    @weak_dates = Food.weak_dates
    @order = current_user.orders.find_forming_or_create
  end
end
