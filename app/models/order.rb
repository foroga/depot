class Order < ActiveRecord::Base
	has_many :items
	has_many :order_suppliers

	scope :sorted, lambda { order('orders.state ASC') }
end
