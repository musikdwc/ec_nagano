class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
t.integer :genre_id
t.text :product_name
t.integer :non_tax
t.text :product_image_id
t.text :product_description
t.integer :product_status
t.datetime :created_at
t.datetime :updated_at
t.timestamps null: false
t.timestamps null: false
   end
 end
end
