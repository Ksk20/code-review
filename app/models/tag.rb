class Tag < ApplicationRecord
	has_many :book_tags, dependent: :destroy, foreign_key: 'tag_id'
	has_many :books, through: :book_tags
	belongs_to :person, optional: true
end
