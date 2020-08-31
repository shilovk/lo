# frozen_string_literal: true

class FoodsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @weak_days = Food.weak_days
    @weak_dates = Food.weak_dates
    @foods = Food.all
  end

  def food_params
    params.require(:food).permit(:title)
  end
end
