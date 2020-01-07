class OrdersController < ApplicationController
  before_action :set_store

  def create
    @order = @store.orders.new(order_params)
    if @order.save
      add_products
      json_response(@order, :created)
    else
      json_response({ message: Message.item_not_created('Order'), errors: @order.errors }, :unprocessable_entity)
    end
  end

  def update_issued
    @order = @store.orders.find(params[:order_id]).issued!
    json_response(nil, :no_content)
  end

  def to_do
    @orders = @store.orders.where(issued: false)
    json_response(@orders, :ok)
  end

  private

  def order_params
    params.require(:order).permit(:total_price, :profit, :store_id)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def add_products
    return unless params[:products].present?

    params[:products].each { |p| @order.products << @store.central.products.find(p) }
  end
end
