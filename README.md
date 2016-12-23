# rails-example-active-record-and-mongoid

An example Rails app demonstrating using both ActiveRecord and Mongoid, including an association between two models stored in different databases.

User is an ActiveRecord model and Post is a Mongoid model. In this example, one user is associated with many posts.

## Example:

### Create a user

```ruby
bob = User.create(email: 'bob@email.com')
```

### Create a post

```ruby
greeting = Post.new(title: 'Hello', body: 'World')
```

### Associate post with user

This sets the post's User foreign key to the user's primary key value. It is not yet persisted in the database.

```ruby
greeting.user = bob
```

### Persist post

This persists the foreign key change in the database, permanantly associating the models.

```ruby
greeting.save
```

### Get the post's user

Returns type **User** because this is the **one** side of a **one-to-many** relationship.

```ruby
greeting.user
```

### Get the user's posts

Returns type **Mongoid::Criteria** because this is the **many** side of a **one-to-many** relationship. 

```ruby
bob.posts
```

This allows a Mongoid query to be chained to filter the posts.

```ruby
bob.posts.find_by(title: 'Hello')
```

If the query targets only one post, this returns type **Post**.
