class Order < ApplicationRecord
	has_many :order_details
	accepts_nested_attributes_for :order_details
	belongs_to :customer
	enum order_status:{
	入金待ち: 0, 入金確認: 1, made: 2, 発送準備中: 3, 発送済み: 4
	}
	enum payment_method:{
	クレジットカード: 0, 現金振込: 1
	}
end
