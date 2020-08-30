# frozen_string_literal: true

class FoodsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @foods = Food.all
  end

  def food_params
    params.require(:food).permit(:title)
  end
end
