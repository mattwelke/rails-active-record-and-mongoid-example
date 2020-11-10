require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create post" do
    p = Post.create(title: "Some Title", body: "Some body.")
    puts 'Post created.'
  end

  test "can create posts for user" do
    u = User.create(email: 'test@email.com')
    puts 'User created.'
    p = Post.create(title: "Some Title", body: "Some body.")
    puts 'Post created.'
    u.posts.append(p)
    u.save
    puts 'Post associated with user.'
  end
end
