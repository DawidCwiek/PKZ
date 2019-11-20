class CentralsController < ApplicationController

  def user_central
    @central = current_user.centrals.first
    @address = @central.address
    @stores = @central.stores
    @employees = @central.users
    json_response(central: @central, address: @address, stores: @stores, employees: @employees)
  end
end
