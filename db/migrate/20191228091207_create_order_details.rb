class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
    	t.integer :order_id
    	t.integer :ordered_price
    	t.string :ordered_item_name
    	t.timestamps
    end
  end
end