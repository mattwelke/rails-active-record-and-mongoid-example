class Post
  include Mongoid::Document
  field :title, type: String
  field :body, type: String

  # Added for association
  field :user_id, type: Integer

  # Association
  def user
    return nil if self.user_id.nil?
    # Find and return the User in ActiveRecord whose id matches the added
    # user_id field
    User.find(self.user_id)
  end
  def user=(user)
    # Set this Post's user_id field to the id of the user parameter
    self.user_id = user.id
  end

end
