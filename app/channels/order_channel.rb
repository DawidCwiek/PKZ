class OrderChannel < ApplicationCable::Channel
  def subscribed
    store = Store.find(params[:store_id])
    stream_from "store_#{store.id}"
    data
  end

  private

  def data
    ActionCable.server.broadcast "store_#{params[:store_id]}", data: Store.find(params[:store_id]).orders.where(issued: false)
  end
end
