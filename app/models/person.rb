class Person < ActiveRecord::Base
	has_secure_password 
	belongs_to :unit
end
