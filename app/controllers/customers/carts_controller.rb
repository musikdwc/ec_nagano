class Customers::CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def create
    @addcart = Cart.new(cart_params)
    @addcart.save
    redirect_to customers_carts_path
  end

  def update
  end

  def destroy
  end

  def cart_params
    params.require(:cart).permit(:item_count, :customer_id, :product_id)
  end
end
