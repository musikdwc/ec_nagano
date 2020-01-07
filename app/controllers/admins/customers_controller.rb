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
    redirect_to admins_customers_path
	end
	def top
		@customer = Customer.find(params[:id])
	end

	def customer_params
  	params.require(:customer).permit(:lastname, :firstname, :lastkana, :firstkana, :telephone_number, :postal_code, :address, :email, :customer_status)
  end
end
