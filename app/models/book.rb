class Book < ApplicationRecord
	belongs_to :customer
	belongs_to :person, optional: true
	has_many :favorites, dependent: :destroy
	has_many :notifications, dependent: :destroy

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


end
