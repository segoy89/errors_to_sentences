# ErrorsToSentences

This gem allows combining multiple error messages of one attribute into one sentence.

For more, see [Usage](#usage) section

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'errors_to_sentences'
```

And then execute:

```shell
$ bundle install
```

Or install it yourself as:

```shell
$ gem install errors_to_sentences
```

## Usage

To generate sentence errors just call `.to_sentences` method on instance errors. For an instance:

Let's say we have a model that looks like:

```ruby
class Refueling < ApplicationRecord
  belongs_to :user

  with_options numericality: { greater_than: 0 } do
    validates :liters,     presence: true
    validates :kilometers, presence: true
    validates :cost,       allow_nil: true
  end
end
```

```shell
$ refueling = Refueling.new
 => #<Refueling id: nil, user_id: nil, liters: nil, cost: nil, kilometers: nil, avg_fuel_consumption: nil, note: nil, created_at: nil, updated_at: nil>

$ refueling.validate!
 ActiveRecord::RecordInvalid (Validation failed: User must exist, Liters is not a number, Liters can't be blank, Kilometers is not a number, Kilometers can't be blank)

$ refueling.errors.full_messages
 => ["User must exist", "Liters is not a number", "Liters can't be blank", "Kilometers is not a number", "Kilometers can't be blank"]
```

and now **`.to_sentences`** method

```shell
$ refueling.errors.to_sentences
 => ["User must exist", "Liters is not a number and can't be blank", "Kilometers is not a number and can't be blank"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/segoy89/errors_to_sentences>.
