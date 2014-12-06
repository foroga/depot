class OrderSupplier < ActiveRecord::Base
	belongs_to :order
	belongs_to :supplier

	acts_as_list :scope => :order
end
