class Portrait < ApplicationRecord
	belongs_to :customer
	belongs_to :person
	attachment :image
end
