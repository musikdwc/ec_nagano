class Customers::OrdersController < ApplicationController
	# before_action :order_params
	def index

	end
	def show

	end
	def about
		@customer = current_customer
		@order = @customer.orders.new
		@carts = current_customer.carts
	    @tax = Tax.find(1).tax
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
		if
		    @customer = current_customer
      		@order = Order.new
			@order.save
		    @customer = current_customer
		    redirect_to customers_thanks_path
   		else
      		render :new
    	end

	end


private

	def order_params
		params.require(:order).permit(:shipping_cost, :production_status, :order_status, :payment_method, :deliver_to, :shipping_name, :order_post)
	end
end
