class Product < ApplicationRecord
	belongs_to :genre
 	attachment :product_image
	enum product_status: {
		販売中: 0, 販売停止中: 1
	}
end
