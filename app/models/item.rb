class Item < ActiveRecord::Base
	belongs_to :order
	belongs_to :supplier
	has_many :requests
end
