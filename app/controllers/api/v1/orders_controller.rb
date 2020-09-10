class Api::V1::OrdersController < Api::V1::BaseController
  before_action :set_order, only: :show

  authorize_resource

  def index
    @orders = Order.on_date(Time.current.to_date)
    render json: @orders
  end

  def show
    render json: @order
  end

  private

  def set_order
    @order = Order.find(params['id'])
  end
end
