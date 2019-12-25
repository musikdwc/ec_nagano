class Admins::CustomersController < ApplicationController

	def index
		@customers = Customer.all
    end
	def show
		@customer = Customer.find(params[:id])
	end
	def edit
		@customer = Customer.find(params[:id])
	end
	def update
		@customer = Customer.find(params[:id].to_i)
		@customer.update(customer_params)
        redirect_to customers_path
	end
	def top
		@customer = Customer.find(params[:id])
	end

end
