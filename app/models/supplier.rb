class Supplier < ActiveRecord::Base
	has_many :products
	has_many :order_supplier
	belongs_to :unit
end
