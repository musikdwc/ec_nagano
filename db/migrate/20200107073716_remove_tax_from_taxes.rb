class RemoveTaxFromTaxes < ActiveRecord::Migration[5.2]
  def change
    remove_column :taxes, :tax, :integer
  end
end
