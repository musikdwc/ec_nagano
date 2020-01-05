class ProductsController < ApplicationController
  before_action :authenticate_customer!, { except: [:top, :about, :index, :show, :search_genre] }
  def top
    @products = Product.all
  end

  def about
  end

  def index
    @genres = Genre.all
  	@products = Product.all
    #  @cookies = Product.where(:genre_id:1)L
    # @cakes = Product.where(:genre_id:2)
    # @bakes = Product.where(:genre_id:3)
    # @seasons = Product.where(:genre_id:4)
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


