# rails-example-active-record-and-mongoid
An example Rails app demonstrating using both ActiveRecord and Mongoid, including an association between two models stored in different databases.

User is an ActiveRecord model and Post is a Mongoid model. In this example, one user is associated with many posts.

# Example:

Create a user
> `bob = User.create(email: 'bob@email.com')`

Create a post
> `greeting = Post.new(title: 'Hello', body: 'World')`

Associate
> `greeting.user = bob`

Persist model with foreign key (post)
> `greeting.save`

Get the post's user
> `greeting.user`
> `=> #<User>`

Get the user's posts
> `bob.posts`
> `=> #<Mongoid::Criteria>`

Build a 'posts' Mongoid query
> `bob.posts.find_by(title: 'Hello')`
> `=> #<Post>`
