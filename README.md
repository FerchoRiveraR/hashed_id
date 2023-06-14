# Hashed Ids
### Hashed IDs for your Ruby on Rails models

This gem allows you to easily use [Hashids](http://hashids.org/ruby/) in your
Rails app. Instead of your models using sequential numbers like 1, 2, 3, they
will instead have unique short hashes like "ABC123", "abc123", and
"aBc123". The database will still use integers under the hood, so this gem can
be added or removed at any time.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "hashed_ids"
```

## Usage

Add `has_hash_id` to your models to autogenerate hash IDs.

```ruby
class User < ApplicationRecord
  has_hash_id
end
```

This will generate a value like `ABC123`.

Note: You should add `has_hash_id` before associations because it overrides `has_many` to add hash ID lookups.

##### Hash ID Param

To retrieve the hash ID, simply call:

```ruby
@user.to_param
```

##### Query by Hash ID

To query using the hashed ID, you can use either `find`, `find_by_hashid`, or `find_by_hashid!`:

```ruby
User.find("ABC123")
User.find_by_hashid("ABC123")
```

### Generic Lookup By Hash ID

Imagine you have a hashed ID but you don't know which model it belongs to.

```ruby
HashedIds.find("ABC123")
#=> #<User>
HashedIds.find("123ABC")
#=> #<Post>
```

### Models

Declare the models with explicitly map the relation between class and integer.

```ruby
HashedIds.models = {
  User: 0,
  Post: 1
}.stringify_keys!.freeze
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/ferchoriverar/hashed_ids. This project is intended to be a safe, welcoming space for collaboration.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
