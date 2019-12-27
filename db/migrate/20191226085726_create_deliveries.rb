class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
	t.string :delivery_address
	t.string :delivery_name
	t.string :delivery_post
     t.timestamps
    end
  end
end
