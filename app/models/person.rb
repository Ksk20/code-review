class Person < ApplicationRecord
	belongs_to :customer, optional: true
	has_many :books
  	has_many :portraits
  	has_many :creations
end
