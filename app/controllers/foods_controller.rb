class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: %i[show edit update destroy]

  authorize_resource

  def index
    @date = params[:date] || Time.current.to_date
    @foods = Food.on_date(@date)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @food.update(food_params)
      redirect_to foods_path
    else
      render :edit
    end
  end

  def destroy
    @food.destroy

    redirect_to foods_path, notice: 'Food was successfuly deleted'
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:title, :price)
  end
end
