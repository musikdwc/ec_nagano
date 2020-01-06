class ProductsController < ApplicationController
  before_action :authenticate_customer!, { except: [:top, :about, :index, :show, :search_genre] }
  def top
    @products = Product.all.page(params[:page]).reverse_order
    @tax = Tax.find(1).tax
  end

  def about
  end

  def index
    @genres = Genre.all
    @product_onsale = Product.where(product_status: 0).all.page(params[:page]).reverse_order
    @tax = Tax.find(1).tax

  end

  def search_genre
    @genres = Genre.all
    @products = Product.where(genre_id: params[:id].to_i)
    render :index
  end

  def show
  	@product = Product.find(params[:id])
    @addcart = Cart.new

    @tax = Tax.find(1).tax
  end


  def product_params
    params.require(:product).permit(:genre_id, :product_name, :non_tax, :product_image_id, :product_description, :product_status)
  end

end
