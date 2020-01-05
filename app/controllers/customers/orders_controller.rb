class Customers::OrdersController < ApplicationController
	before_action :order_params, only: [:about]
	def index

	end
	def show

	end
	def about
	@carts = current_customer.carts
    @tax = Tax.find(1).tax
    	if params[:post1] == "post_mine_group"
			@customer = current_customer
 			@order.order_post = @customer.postal_code
 			@order.deliver_to = @customer.address
 			@order.shipping_name = @customer.lastname + @customer.firstname
    	elsif params[:post2] == "post_deli_group"
    		@customer = current_customer
      		@order.order_post = @customer.delivery.delivery_post
 			@order.deliver_to = @customer.delivery.delivery_address
 			@order.shipping_name = @customer.delivery.delivery_name
			@order.save
      	elsif params[:post3] == "post_new_group"
		    @customer = current_customer
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
	    @order = Order.new(params.require(:order).permit(:shipping_cost, :production_status, :order_status, :payment_method, :deliver_to, :shipping_name, :order_post).merge(customer_id: current_customer.id))
	end
end
