class Book < ApplicationRecord
	belongs_to :customer
	belongs_to :person
end
