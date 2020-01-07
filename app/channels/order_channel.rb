class OrderChannel < ApplicationCable::Channel
  def subscribed
    store = Store.find(params[:store_id])
    stream_from "store_#{store.id}"
  end
end
