class ProductsController < ApplicationController
  # あとでbefore_action :authenticate_user!を追加
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
    @addcart = Cart.new
  end


  def top
  end

  def customer_params
    params.require(:product).permit(:genre_id, :product_name, :non_tax, :product_image_id, :product_description, :product_status)
  end
end
