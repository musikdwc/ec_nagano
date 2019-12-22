class AddCustomerStatusToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :customer_status, :integer
  end
end
