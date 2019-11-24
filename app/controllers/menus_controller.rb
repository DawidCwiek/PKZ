class MenusController < ApplicationController

  def index
    @menus = current_user.centrals.find(params[:central_id]).menu
    json_response(@menus, :ok)
  end

  def show
    @menu = current_user.centrals.find(params[:central_id]).menu.find(params[:menu_id])
    json_response(@menu, :ok)
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      json_response(@menu, :created)
    else
      json_response(Message.item_not_created("Menu"), :unprocessable_entity)
    end
  end

  def update
  end

  def destroy
  end

  private

  def menu_params
    params.permit(:name, :active, :central_id)
  end
end
