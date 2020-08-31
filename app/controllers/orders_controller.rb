class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = current_user.orders
  end

  def new
    @order = @test.orders.new
  end

  def create
    @order = current_user.orders.new(order_params)

    if @order.save
      redirect_to root_path(order: @order)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @order.update(order_params)
      redirect_to root_path(order: @order)
    else
      render :edit
    end
  end

  def destroy
    @order.destroy

    redirect_to root_path, notice: 'Order was successfuly deleted'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:total_price)
  end
end
