ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => 'smtp.gmail.com',
  :user_name => ENV['MAIL_ADDRESS'], #gmailアドレス
  :password => ENV['MAIL_ADDRESS_PASSWORD'], #gmailパスワード
  :authentication => 'login',
}
