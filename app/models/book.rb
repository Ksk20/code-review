class Book < ApplicationRecord
	belongs_to :customer
	belongs_to :person
	has_many :favorites, dependent: :destroy

	validates :title, presence:true
	validates :title, presence:true

	def favorited_by?(customer)
		favorites.where(customer_id: customer.id).exists?
	end
end
