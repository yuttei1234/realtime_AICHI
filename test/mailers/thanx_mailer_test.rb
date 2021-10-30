require 'test_helper'

class ThanxMailerTest < ActionMailer::TestCase
  test "complete_registration" do
    mail = ThanxMailer.complete_registration
    assert_equal "Complete registration", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
