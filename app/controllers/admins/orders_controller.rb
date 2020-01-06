class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end
	def show
		@order = Order.find(params[:id])
	end
	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
        redirect_to admins_customer_path
	end
	def top
		from = Time.current.beginning_of_day
		to = Time.current.end_of_day
		@count = Order.where(created_at: from..to).count

	end
	def order_params
		params.permit(:deliver_to, :shipping_name, :order_postshipping_cost, :order_status, :payment_method, :created_at)
	end
	def order_detail_params
		params.require(:order_detail).permit(:ordered_price, :ordered_item_name, :ordered_item_count, :production_status)
	end
end
