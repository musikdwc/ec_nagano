class AddTaxToTaxes < ActiveRecord::Migration[5.2]
  def change
    add_column :taxes, :tax, :decimal, precision: 1, scale: 1
  end
end
