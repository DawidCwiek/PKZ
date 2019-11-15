class CentralsController < ApplicationController
  before_action :require_permission

  def show
    @central = Central.find(params[:id])
    @address = @central.address
    json_response(central: @central, address: @address)
  end

  private

  def require_permission
    if Central.find(params[:id]).users.where(id: current_user.id).blank?
      json_response({ message: Message.no_permission }, :forbidden)
    end
  end
end
