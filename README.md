# Ovto::Router

A router for [Ovto](https://github.com/yhara/ovto).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ovto-router'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ovto-router

## Usage

```ruby
require 'ovto'
require 'ovto/router'

class MyApp < Ovto::App
  class State < Ovto::State
    include Ovto::Router::State
  end

  class Actions < Ovto::Actions
    include Ovto::Router::Actions
  end

  class MainComponent < Ovto::Component
    def render
      o 'div' do
        o Ovto::Router::HashRouter, routes: {
          "/": -> { o 'h1', 'Root' },
          "/hello": -> { o 'h2', "Hello" },
          "/bye": -> { o 'h2', "Bye" },
        }

        o Ovto::Router::Link, path: '#/', text: 'go to root'
        o 'br'
        o Ovto::Router::Link, path: '#/hello', text: 'go to hello'
        o 'br'
        o Ovto::Router::Link, path: '#/bye', text: 'go to bye'
      end
    end
  end
end

MyApp.run(id: 'ovto')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pocke/ovto-router.
