class Product < ActiveRecord::Base
	belongs_to :supplier
	scope :sorted, lambda { order('name.position ASC') }
end
