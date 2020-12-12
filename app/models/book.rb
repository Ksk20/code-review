class Book < ApplicationRecord
	belongs_to :customer
	belongs_to :person, optional: true
	has_many :favorites, dependent: :destroy
	has_many :notifications, dependent: :destroy
  has_many :book_tags, dependent: :destroy, foreign_key: 'book_id'
  has_many :tags, through: :book_tags
  attachment :scribble
	validates :title, presence:true
	validates :caption, presence:true
  validates :grade, presence:true

	def favorited_by?(customer)
		favorites.where(customer_id: customer.id).exists?
	end

  def create_notification_by(current_customer)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and book_id = ? and action = ? ",
                                  current_customer.id, customer_id, id, 'favorite'])
    if temp.blank?
      notification = current_customer.active_notifications.new(
        book_id: id,
        visited_id: customer_id,
        action: 'favorite'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  #検索メソッド、タイトルと内容をあいまい検索する
  def self.search(keyword)
    Book.where(['title LIKE ? OR caption LIKE ?', "%#{keyword}%", "%#{keyword}%"])
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    # Destroy
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    # Create
    new_tags.each do |new|
      newtag = Tag.find_or_create_by(name: new)
      self.tags << newtag
    end
  end
end
