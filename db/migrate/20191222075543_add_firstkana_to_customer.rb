class AddFirstkanaToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :firstkana, :string
  end
end
