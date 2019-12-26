class ProductsController < ApplicationController
  # あとでbefore_action :authenticate_user!を追加
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end


  def top
  end

end

