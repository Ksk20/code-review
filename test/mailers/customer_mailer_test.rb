require 'test_helper'

class CustomerMailerTest < ActionMailer::TestCase
  test "customer_welcome_mail" do
    mail = CustomerMailer.customer_welcome_mail
    assert_equal "Customer welcome mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
