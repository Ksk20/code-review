module Customers::NotificationsHelper

	def notification_form(notification)
      @visitor = notification.visitor
      your_book = link_to 'あなたの投稿',  person_path(notification), style:"font-weight: bold;"

      case notification.action
        when "favorite" then
        	tag.a(notification.visitor.name, href: customer_path(@visitor)) + 'が' + tag.a('あなたの投稿', href: "#") + 'にいいねしました'
      end
    end

	def unchecked_notifications
    	@notifications = current_customer.passive_notifications.where(checked: false)
	end
end
