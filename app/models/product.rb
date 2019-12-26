class Product < ApplicationRecord
	belongs_to :genre
 	attachment :product_image
	enum product_status:{有効:0, 無効:1}
end
