class AddProductionStatusToorderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :production_status, :integer, default: 1
  end
end
