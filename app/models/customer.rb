class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable
    has_many :carts
    has_many :orders
    enum customer_status: {有効: 0, 無効: 1 }
  	has_many :deliveries
	validates :lastname, presence: true
	validates :firstname, presence: true
	validates :lastkana, presence: true
	validates :firstkana, presence: true
	validates :email, presence: true
	validates :telephone_number, presence: true
	validates :postal_code, presence: true
	validates :address, presence: true
	validates :customer_status, inclusion: { in: Customer.customer_statuses.keys }
	def self.find_for_authentication(conditions)
		super(conditions.merge(:customer_status => "有効"))
	end
	# def inactive_message
	# 無効? super: :invaild_status
 #    end
	def customer_status!
      if 有効?
         無効!
      else
        無効!
      end
    end
 #    def active_for_authentication?
 #    super && 有効?
 #    end
    def inactive_message
	無効? super :invaild_status
    end
	# allow customers to update their accounts without passwords
end
