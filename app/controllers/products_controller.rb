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
  end


end

