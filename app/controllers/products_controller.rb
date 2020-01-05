class ProductsController < ApplicationController
  before_action :authenticate_customer!, { except: [:top, :about, :index, :show] }
  def top
    @products = Product.all
  end

  def about
  end

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
    @addcart = Cart.new
  end


  def top
  end

  def product_params
    params.require(:product).permit(:genre_id, :product_name, :non_tax, :product_image_id, :product_description, :product_status)
  end

end
