class Admins::ProductsController < ApplicationController
 # あとでbefore_action :authenticate_user!を追加
  def index
    @product_all = Product.all

  end

  def show
    @product = Product.find(params[:id])
    @genre = @product.genre.genre_name
  end

  def new
    @product_new = Product.new
    @genre = Genre.all
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
    @genre = Genre.all
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
      # range = Date.today.beginning_of_day..Date.today.end_of_day
      # @count = Order.where(created_at: range)
  end


private
  def products_params
      params.require(:product).permit(:product_name, :non_tax, :product_image, :product_description, :product_status, :genre_id)
  end

end