class DeliveriesController < ApplicationController
	def index
		@customer = current_customer
		@deliveries = current_customer.deliveries
		@delivery_new = Delivery.new
	end
	def create
			@delivery = current_customer.deliveries.build(delivery_params)
			@delivery.customer_id = current_customer.id
		if  @delivery.save
		    redirect_to customer_deliveries_path
		else
			@customer = current_customer
			@deliveries = current_customer.deliveries.all
			render :index
		end
	end
	def edit
		@customer = current_customer
		@delivery = Delivery.find(params[:id])
	end
	def update
		@customer = current_customer
		@delivery = Delivery.find(params[:id])
		@delivery.update(delivery_params)
		redirect_to customer_deliveries_path
	end
	def destroy
		@delivery = Delivery.find(params[:id])
        @delivery.destroy
        redirect_to customer_deliveries_path
	end
	def delivery_params
    		params.require(:delivery).permit(:delivery_address, :delivery_post, :delivery_name)
    end
end
