# example-rails-active-record-and-mongoid

An example Rails app demonstrating using both ActiveRecord and Mongoid, including an association between two models stored in different databases.

User is an ActiveRecord model and Post is a Mongoid model. In this example, one user is associated with many posts.

## Prepare for use

The project is set up to use CircleCI to help with Dependabot keeping the dependencies up to date. If you plan to not use CI or to use CI other than CircleCI, you can clean out CircleCI-related code from the project with the command `rm -r .circleci` from the project root.

## Running

1. Ensure the required gems are installed.
1. Ensure MongoDB is running. If you have Docker and docker-compose installed, you can use `docker-compose up` to create a stack that includes MongoDB.

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

This sets the post's User foreign key to the user's primary key value (posts are the **many** side of a **one-to-many** relationship. It is not yet persisted in the database.

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

### Hitting both data stores

Note that some queries will perform synchronous reads from both data stores.

```ruby
User.find_by(name: 'Bob').posts.where(title: 'Hello') # Hits Users in Postgres, then Posts in MongoDB
```

Consider storing references during controller actions to minimize data store hits.

Instead of doing this:

```ruby
# Find bob's "hello" posts
hello_posts = User.find_by(name: 'Bob').posts.where(title: 'Hello')
# Then, find bob's "goodbye" posts
goodbye_posts = User.find_by(name: 'Bob').posts.where(title: 'Goodbye')
```

Do this:

```ruby
# store reference to Bob
bob = User.find_by(name: 'Bob')

# now, only need to hit MongoDB for any posts for this user (won't hit Postgres again)
hello_posts = bob.posts.where(title: 'Hello')
goodbye_posts = bob.posts.where(title: 'Goodbye')
```

### Details

See the model code in this repo to see how defining methods on each model that interact with the other data store's API links the models together, as if you were using just ActiveRecord or just Mongoid.

These concepts apply to more than just ActiveRecord and Mongoid. You can link models from any persistence mechanism, including databases, REST endpoints, memory caches, etc, by defining methods like these.


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fwelkie%2Fexample-rails-active-record-and-mongoid.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fwelkie%2Fexample-rails-active-record-and-mongoid?ref=badge_large)
