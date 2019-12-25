class Admins::ProductsController < ApplicationController
 # あとでbefore_action :authenticate_user!を追加
  def index
    @product_all = Product.all
  end

  def show
     @product = Product.find(params[:id])
  end

  def new
    @product_new = Product.new
  end

  def create

    @product = Product.new(products_params)
    if @product.save
      redirect_to admins_product_path(@product.id)
    else
      redirect_to admims_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(products_params)
      redirect_to admins_product_path
    else
      redirect_to admins_products_path
    end
  end


  def top
  end


private
  def products_params
      params.require(:product).permit(:product_name, :non_tax, :product_image, :product_description)
  end

end