class CreateOrder < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_cost, default: 800, null: false
	  t.integer :production_status ,default: 0, null: false
	  t.integer :order_status ,default: 0, null: false
	  t.integer :payment_method ,default: 0, null: false
	  t.integer :order_post
	  t.string :deliver_to
	  t.string :shipping_name
      t.timestamps
    end
  end
end
