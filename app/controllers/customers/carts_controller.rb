class Customers::CartsController < ApplicationController
  def index
    @carts = current_customer.carts
    @customer = current_customer
    @tax = Tax.find(1).tax
  end

  def create
    @addcart = Cart.new(cart_params)
    @addcart.customer_id = current_customer.id
    @addcart.save
    redirect_to customers_carts_path
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to customers_carts_path
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
