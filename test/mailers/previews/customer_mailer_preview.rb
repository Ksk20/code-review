# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/customer_mailer/customer_welcome_mail
  def customer_welcome_mail
    CustomerMailer.customer_welcome_mail
  end

end
