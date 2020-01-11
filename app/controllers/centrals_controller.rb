class CentralsController < ApplicationController
  def user_central
    @central = current_user.centrals.first
    json_response(@central, :ok)
  end

  def active_menu
    @menu = current_user.stores.find(params[:store_id]).central.menu.where(active: true)
    json_response(@menu, :ok)
  end

  def create_store
    @central = current_user.centrals.find(params[:central_id])
    @store = @central.stores.new(store_params)
    if @store.save
      @store.create_address(store_address_params)
      json_response(@store, :created)
    else
      json_response({ message: Message.item_not_created('Store'), errors: @store.errors }, :unprocessable_entity)
    end
  end

  def avg_centra_total_price
    total_arr = []
    all_order = Order.includes(:store).where(stores: {central_id: current_user.centrals.first.id })
    group_order = all_order.where(created_at: 1.week.ago .. Time.now.end_of_day).group_by { |t| t.created_at.to_date }
    quantity = current_user.centrals.first.stores.count

    group_order.each { |key,value| total_arr.append({ day: key.strftime("%A"), value: avg_order(value, quantity) }) }
    total_arr.sort! { |a, b| Date.strptime("#{a[:day]}", '%A').wday <=> Date.strptime("#{b[:day]}", '%A').wday }
    json_response({data: total_arr}, :ok)
  end

  private

  def store_params
    params.permit(:name)
  end

  def store_address_params
    params.require(:address).permit(:city, :zip_code, :street)
  end

  def avg_order(value, quantity)
    sum = 0
    value.each { |v| sum += v.total_price}
    (sum/quantity).round(2)
  end
end
