class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = current_user.centrals.find(params[:central_id]).products
    json_response(@products, :ok)
  end

  def show
    json_response({ product: @product, components: @product.components }, :ok)
  end

  def create
    @product = current_user.centrals.find(params[:central_id]).products.new(product_params)
    if @product.save
      @product.components << current_user.centrals.find(params[:central_id]).warehouse.components.find(params[:components])
      json_response({ product: @product, components: @product.components }, :created)
    else
      json_response({ message: Message.item_not_created('Product'), errors: @product.errors }, :unprocessable_entity)
    end
  end

  private

  def set_product
    @product = current_user.centrals.find(params[:central_id]).products.find(params[:product_id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :central_id)
  end
end
