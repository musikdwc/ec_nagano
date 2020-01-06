class RemoveProductionStatusFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :production_status, :integer
  end
end
