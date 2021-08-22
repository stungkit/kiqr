
Kiqr
==============

[![works badge](https://cdn.jsdelivr.net/gh/nikku/works-on-my-machine@v0.2.0/badge.svg)](https://github.com/nikku/works-on-my-machine)
[![Gem Version](https://badge.fury.io/rb/kiqr.svg)](https://badge.fury.io/rb/kiqr)
[![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)

**Kiqr** is an open-source framework for creating SaaS applications with Ruby on Rails.

**If you're new to Kiqr, we strongly recommend you to start with our pre-configured app [kiqr_starter](https://github.com/kiqr/kiqr_starter).**

#### Requirements

- Ruby 2.5 or higher
- Rails 6.1.4 or higher
- A [Paddle.com](https://paddle.com) vendor account to enable subscriptions.

#### Included dependencies

_Kiqr comes bundled with some third-party Ruby Gems. These are all well tested and receives regular security updates allowing you to focus on your own code:_
- [paddle_pay](https://github.com/devmindo/paddle_pay) - A Ruby wrapper for the Paddle.com API


## Installation
### Option A: Use Kiqr Starter
Head over to [kiqr_starter](https://github.com/kiqr/kiqr_starter) and read the instructions there.

### Option B: Adding Kiqr to an existing application

Once you have solidified your understanding of Devise and it's authentication mechanisms, we assure you Kiqr will be very pleasant to work with. 😃

##### Add the following line to your Gemfile:
```ruby
gem 'devise' # Authentication with Devise
gem 'kiqr'
```

##### Install dependencies
```bash
$ bundle install
```

##### Install Devise and generate a model
```bash
$ bundle exec rails generate devise::install
$ bundle exec rails generate devise User
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
