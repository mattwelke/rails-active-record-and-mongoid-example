# rails-example-active-record-and-mongoid
An example Rails app demonstrating using both ActiveRecord and Mongoid, including an association between two models stored in different databases.

User is an ActiveRecord model and Post is a Mongoid model. In this example, one user is associated with many posts.

# Example:

## Create a User:
bob = User.create(email: 'bob@email.com')

## Create a Post:
greeting = Post.new(title: 'Hello', body: 'World')

## Associate
greeting.user = bob
