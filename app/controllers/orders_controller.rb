class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dates, only: :index
  before_action :set_order, only: %i[show edit update destroy]

  authorize_resource

  def index
    @orders = Order.on_date(@date)
    @orders = @orders.where(user_id: current_user.id) unless current_user.admin?
  end

  def new
    @order = current_user.orders.new
  end

  def create
    @order = current_user.orders.new(order_params)

    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if params[:food_id]
      food = Food.find(params[:food_id])
      @order.add_food(food)
      redirect_to root_path
    elsif @order.update(order_params)
      redirect_to orders_path
    else
      render :edit
    end
  end

  def destroy
    @order.destroy

    redirect_to orders_path, notice: 'Order was successfuly deleted'
  end

  private

  def set_dates
    @date = (params[:date] || Time.current).to_date
    @prev_date = @date - 1.day
    @next_date = @date + 1.day
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:total_price, :status)
  end
end
