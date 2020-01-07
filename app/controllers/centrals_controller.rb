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

  private

  def store_params
    params.permit(:name)
  end

  def store_address_params
    params.require(:address).permit(:city, :zip_code, :street)
  end
end
