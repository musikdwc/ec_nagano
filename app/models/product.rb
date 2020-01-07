class Product < ApplicationRecord
    has_many :carts
	belongs_to :genre
 	attachment :product_image
	enum product_status: {
		販売中: 0, 販売停止中: 1
	}

  def self.search(search)
    if search
      Product.where(['product_name LIKE ?', "%#{search}%"])
    else
      Product.all
    end
  end
end
