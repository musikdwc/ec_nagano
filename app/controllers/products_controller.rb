class ProductsController < ApplicationController
  # あとでbefore_action :authenticate_user!を追加
  def index
  	@producut = Product.all
  end

  def show
  	@prodcuts = product.find(params[:id])
  end


  def top
  end

end

