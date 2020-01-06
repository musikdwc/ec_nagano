class ProductsController < ApplicationController
  before_action :authenticate_customer!, { except: [:top, :about, :index, :show, :search_genre] }
  def top
    @products = Product.all.page(params[:page]).reverse_order
  end

  def about
  end

  def index
    @genres = Genre.all
  	@products = Product.all.page(params[:page]).reverse_order
  end

  def search_genre
    @genres = Genre.all
    @products = Product.where(genre_id: params[:id].to_i)
    render :index
  end

  def show
  	@product = Product.find(params[:id])
  end


end


