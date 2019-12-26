class CustomersController < ApplicationController
	  before_action :set_customer, only: [:show, :edit, :update, :destroy, :customer_status]
	def show
		@customer = current_customer
	end
	def edit
		@customer = Customer.find(params[:id].to_i)
	end
	def cancel
		@customer = Customer.find(params[:id].to_i)
	end
	def update
		@customer = Customer.find(params[:id].to_i)
		@customer.update(customer_params)
        redirect_to admins_customer_path
    end
    def pass
		@customer = current_customer
    end
    def customer_status
    @customer.customer_status!
    redirect_to @customer, notice: 'successfully updated.'
  	end
    def customer_params
  	params.require(:customer).permit(:lastname, :firstname, :lastkana, :firstkana, :telephone_number, :postal_code, :address, :email, :customer_status)
    end
    private
    def set_customer
      @customer = current_customer ||  Customer.find(params[:id])
    end
end
