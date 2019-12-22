class AddLastkanaToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :lastkana, :string
  end
end
