class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  def index
    @products = current_user.centrals.find(params[:central_id]).products
    json_response(@products, :ok)
  end

  def show
    json_response(@product, :ok)
  end

  def create
    @product = current_user.centrals.find(params[:central_id]).products.new(product_params)
    if @product.save
      add_components
      json_response(@product, :created)
    else
      json_response({ message: Message.item_not_created('Product'), errors: @product.errors }, :unprocessable_entity)
    end
  end

  def update
    if @product.update(product_params)
      @product.components.destroy_all
      add_components
      json_response(@product, :ok)
    else
      json_response({ message: Message.item_not_update('Product'), errors: @product.errors }, :unprocessable_entity)
    end
  end

  def destroy
    @product.destroy
    json_response(nil, :no_content)
  end

  private

  def set_product
    @product = current_user.centrals.find(params[:central_id]).products.find(params[:product_id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :central_id, :image)
  end

  def add_components
    return unless params[:components].present?

    @product.components << current_user.centrals.find(params[:central_id]).warehouse.components.find(params[:components])
  end
end
