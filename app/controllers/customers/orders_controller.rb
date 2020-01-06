class Customers::OrdersController < ApplicationController
	before_action :order_params, only: [:about]
	def index

	end
	def show

	end
	def about
	@carts = current_customer.carts
    @tax = Tax.find(1).tax
    end
	def thanks
	@customer = current_customer
	end
	def new
		@customer = current_customer
		@deliveries = current_customer.deliveries
	end
	def create
		if	@order = Order.new
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
