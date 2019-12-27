class Customers::CartsController < ApplicationController
  def index
    @carts = current_customer.carts
  end

  def create
    @addcart = Cart.new(cart_params)
    @addcart.customer_id = current_customer.id
    @addcart.save
    redirect_to customers_carts_path
  end

  def update
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to customers_carts_path
  end

  def all_destroy
    @carts = current_customer.carts
    @carts.delete_all
    redirect_to customers_carts_path
  end

  def cart_params
    params.require(:cart).permit(:item_count, :customer_id, :product_id)
  end
end
