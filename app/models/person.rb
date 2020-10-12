class Person < ApplicationRecord
	belongs_to :customer, optional: true
	has_many :books
  	has_many :beginners
  	has_many :portraits
  	has_many :creations
	attachment :image
end
