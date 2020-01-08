class AddorderedItemCountToorderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :ordered_item_count, :integer
  end
end
