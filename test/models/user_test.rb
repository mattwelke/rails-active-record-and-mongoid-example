require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create user" do
    u = User.create(email: 'test@email.com')
    assert u.created_at != nil
    assert u.updated_at != nil
  end
end
