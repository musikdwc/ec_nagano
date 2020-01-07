class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end
	def update
		@order = Order.find(params[:id])
		@order_details = @order.order_details
        # @order.update(order_params)
        @order.update(order_status: params[:order][:order_status].to_i)
	        if @order_details.where(production_status: 2).any?
	        	  @order.update(order_status: 2)
	        else
	        end
	        if @order.order_status_before_type_cast == 1
	        	@order_details.each do |item|
	           		item.update(production_status: 1)
	       		end
	        end
	        if @order_details.count == @order_details.where(production_status: 3).count
	        	  @order.update(order_status: 3)
	        else
	        end

        redirect_to admins_order_path
	end
	def show
		@order = Order.find(params[:id])
	end
	def top
		from = Time.current.beginning_of_day
		to = Time.current.end_of_day
		@count = Order.where(created_at: from..to).count

	end
	def order_params
		params.permit(:deliver_to, :shipping_name, :order_postshipping_cost, :order_status, :payment_method, :created_at, order_detail_attributes: [:id, :production_status])
	end
	def order_detail_params
		params.require(:order_detail).permit(:ordered_price, :ordered_item_name, :ordered_item_count, :production_status)
	end
end
