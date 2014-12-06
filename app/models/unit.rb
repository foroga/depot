class Unit < ActiveRecord::Base
	has_many :suppliers
	has_many :people
end
