class Customers::OrdersController < ApplicationController
	# before_action :order_params
	def index
		@orders = current_customer.orders.includes(:order_details)
	end
	def show
		@order = Order.find(params[:id])
	end
	def about
		@customer = current_customer
		@order = @customer.orders.new
		@carts = current_customer.carts
	    @tax = Tax.find(2).tax
	    @products = Product.all
	    @total_price = 0
	    @carts.each do |cart|
     	@total_price += cart.product.non_tax * cart.item_count * 1.1
     	end
		if params[:post] == "post_mine_group"
			@order.order_post = @customer.postal_code
			@order.deliver_to = @customer.address
			@order.shipping_name = @customer.lastname + @customer.firstname
		elsif params[:post] == "post_deli_group"
			delivery = Delivery.find(params[:registered_address_id].to_i)
  			@order.order_post = delivery.delivery_post
			@order.deliver_to = delivery.delivery_address
			@order.shipping_name = delivery.delivery_name
	  	elsif
	  		params[:post] == "post_new_group"
	  		@order.order_post = params[:order_post]
	  		@order.deliver_to = params[:deliver_to]
	  		@order.shipping_name = params[:shipping_name]
		end
    end
	def thanks
		@customer = current_customer
	end
	def new
		@customer = current_customer
		@deliveries = current_customer.deliveries
	end
	def create
        @order = current_customer.orders.new(order_params)
		if @order.save
		   current_customer.carts.each do |cart|
				@order_detail = OrderDetail.new
				@order_detail.order_id = @order.id
				@order_detail.ordered_item_name = cart.product.product_name
				@order_detail.ordered_price = params[:ordered_price]
				@order_detail.ordered_item_count = cart.item_count
				@order_detail.save
				current_customer.carts.delete_all
		   end
		    redirect_to customers_thanks_path
   		else
      		render :new
    	end
	end


private

	def order_params
		params.permit(:deliver_to, :shipping_name, :order_post)
	end
	def order_detail_params
		params.require(:order_detail).permit(:ordered_price, :ordered_item_name)
	end
end
