class AddFirstnameToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :firstname, :string
  end
end
