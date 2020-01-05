class Product < ApplicationRecord
    has_many :carts
	belongs_to :genre
 	attachment :product_image
	enum product_status:{有効:0, 無効:1}
end
