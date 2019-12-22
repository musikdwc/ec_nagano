class AddTelephoneNumberToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :telephone_number, :string
  end
end
