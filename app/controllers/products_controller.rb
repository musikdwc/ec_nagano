class ProductsController < ApplicationController
  before_action :authenticate_customer!, { except: [:top, :about, :index, :show, :search_genre] }
  def top
    @products = Product.all.page(params[:page]).reverse_order
    @tax = Tax.find(2).tax
  end

  def about
  end

  def index
    @products = Product.search(params[:search])
    @genres = Genre.all
    @product_onsale = Product.where(product_status: 0).all.page(params[:page]).reverse_order
    @tax = Tax.find(2).tax
  end

  def search_genre
    @genres = Genre.all
    @product_onsale = Product.where(genre_id: params[:id].to_i).page(params[:page]).reverse_order
    @tax = Tax.find(2).tax
    render :index
  end

  def show
  	@product = Product.find(params[:id])
    @addcart = Cart.new

    @tax = Tax.find(2).tax
  end


  def product_params
    params.require(:product).permit(:genre_id, :product_name, :non_tax, :product_image_id, :product_description, :product_status)
  end
end
