require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create post" do
    p = Post.create(title: "Some Title", body: "Some body.")
    puts 'Post created.'
  end

  test "can create post for user" do
    u = User.create(email: 'test@email.com')
    puts 'User created.'
    p = Post.create(title: "Some Title", body: "Some body.")
    puts 'Post created.'
    u.posts.append(p)
    u.save
    puts 'Post associated with user.'
    puts "Post title: #{p.title}"
    puts "Post body: #{p.body}"
  end
end
