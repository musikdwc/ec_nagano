class ProductsController < ApplicationController
  before_action :authenticate_customer!, { except: [:top, :about, :index, :show] }
  def top
  end
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end


  def top
  end

end

