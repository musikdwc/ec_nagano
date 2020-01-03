class Customers::CartItemsController < ApplicationController
before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

def index
@cart_items = CartItem.all
end

def show
	@cart = current_cart
    @cart_items = current_cart.cart_items
end

def new
@cart_item = CartItem.new
end

def edit
end

def create
@customer = current_customer
@cart = current_cart
@product = Product.find(params[:product_id])
@cart.cart_items.build(product_params)
@cart_item.save
redirect_to customers_cart_path(@cart,@customer)
end

def update
@cart_item.update(item_count: params[:item_count].to_i)
redirect_to customers_cart_path
end

def destroy
@cart_item.destroy
redirect_to customers_cart_path
end

private
def set_cart_item
@cart_item = CartItem.find(params[:id])
end

def cart_item_params
params.require(:cart_item).permit(:product_id, :cart_id)
end
end
