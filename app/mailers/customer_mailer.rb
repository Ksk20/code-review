class CustomerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.customer_welcome_mail.subject
  #
  def customer_welcome_mail(customer)
    @customer = customer
	mail(to: @customer.email, subject: 'Welcome to Numare')
  end

end
