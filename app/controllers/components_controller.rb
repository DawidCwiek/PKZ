class ComponentsController < ApplicationController
  before_action :set_component, only: %i[show update destroy]

  def index
    @components = current_user.centrals.find(params[:central_id]).warehouse.components
    json_response(@components, :ok)
  end

  def show
    json_response(@component, :ok)
  end

  def create
    @component = current_user.centrals.find(params[:central_id]).warehouse.components.new(product_params)
    if @component.save
      json_response(@component, :created)
    else
      json_response({ message: Message.item_not_created('Component'), errors: @component.errors }, :unprocessable_entity)
    end
  end

  def update
    if @component.update(product_params)
      json_response(@component, :ok)
    else
      json_response({ message: Message.item_not_update('Component'), errors: @component.errors }, :unprocessable_entity)
    end
  end

  def destroy
    @component.destroy
    json_response(nil, :no_content)
  end

  private

  def set_component
    @component = current_user.centrals.find(params[:central_id]).warehouse.components.find(params[:component_id])
  end

  def product_params
    params.require(:component).permit(:name, :quantity, :warehouse_id, :cost)
  end
end
