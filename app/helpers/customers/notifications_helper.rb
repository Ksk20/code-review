module Customers::NotificationsHelper

	def notification_form(notification)
      @visitor = notification.visitor
      book = Book.find(notification.book_id)
      person_id = book.person_id
      #favorites = Favorite.where(favorited_customer_id: current_customer.id).order(updated_at: 'DESC')
      your_book = link_to 'あなたの投稿',  person_path(notification), style:"font-weight: bold;"


      case notification.action
        when "favorite" then
        	tag.a(notification.visitor.name, href: customer_path(@visitor)) + 'が' + tag.a("あなたの投稿の本:#{book.title}", href: person_path(person_id)) + 'にいいねしました'
      end
    end

	def unchecked_notifications
    	@notifications = current_customer.passive_notifications.where(checked: false)
	end
end
