require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
end
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.welcome_email(User.first)
  end
end
