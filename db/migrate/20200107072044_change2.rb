class Change2 < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_details, :production_status, :integer, default: 1
  end
end
