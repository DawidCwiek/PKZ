class MenusController < ApplicationController
  before_action :set_menu, only: %i[show update destroy]

  def index
    @menus = current_user.centrals.find(params[:central_id]).menu
    json_response(@menus, :ok)
  end

  def show
    json_response(@menu, :ok)
  end

  def create
    @menu = current_user.centrals.find(params[:central_id]).menu.new(menu_params)
    if @menu.save
      @menu.products << current_user.centrals.find(params[:central_id]).products.find(products_params[:products])
      json_response(@menu, :created)
    else
      json_response({ message: Message.item_not_created('Menu'), errors: @menu.errors }, :unprocessable_entity)
    end
  end

  def update
    if @menu.update(menu_params)
      @menu.products.destroy_all
      @menu.products << current_user.centrals.find(params[:central_id]).products.find(products_params[:products])
      json_response(@menu, :ok)
    else
      json_response({ message: Message.item_not_update('Menu'), errors: @menu.errors }, :unprocessable_entity)
    end
  end

  def destroy
    @menu.destroy
    json_response(nil, :no_content)
  end

  private

  def set_menu
    @menu = current_user.centrals.find(params[:central_id]).menu.find(params[:menu_id])
  end

  def menu_params
    params.require(:menu).permit(:name, :active, :central_id)
  end

  def products_params
    params.permit(products: [])
  end
end
