class RemoveTaxNumToTaxes < ActiveRecord::Migration[5.2]
  def change
  	remove_column :taxes, :tax, :decimal
  end
end
