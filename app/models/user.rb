class User < ApplicationRecord
  # Association
  def posts
    # Find and return the Posts in Mongoid that match this User's id
    Post.where(user_id: self.id)    
  end
end
