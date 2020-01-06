class AddTaxToTaxes < ActiveRecord::Migration[5.2]
  def change
    add_column :taxes, :tax, :decimal
end
