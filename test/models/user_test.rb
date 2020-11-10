require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create user" do
    u = User.create(email: 'test@email.com')
    puts 'User created.'
    assert u.created_at != nil
    puts "User created_at: #{u.created_at}"
    assert u.updated_at != nil
    puts "User updated_at: #{u.updated_at}"
  end
end
