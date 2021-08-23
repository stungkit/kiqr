
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
### Option A: Use Kiqr Starter (easy)
Head over to [kiqr_starter](https://github.com/kiqr/kiqr_starter) and read the instructions there.

### Option B: Adding Kiqr to an existing application (advanced)

Kiqr requires a User model to be present before beeing installed. [Devise](https://github.com/heartcombo/devise) or another authentication gem is recommended. 

#### Add the following line to your Gemfile:
```ruby
gem 'kiqr'
```

#### Install dependencies
```bash
$ bundle install
```

#### Run the generators
Replace **MODEL** with your Devise user model.
```bash
$ rails generate kiqr::install MODEL
```

## Controllers

### Securing controllers
To set up a controller with user authentication, just add this before_action (assuming you're using Devise and your model is 'User'):
```ruby
before_action :authenticate_user!
```

### Other controller filters and helpers
You'll find more filters and helpers below when browsing the documentation. All Kiqr helpers will automatically be accessible from your ApplicationController. 

## Models

### Account
Kiqr will create a default account for each user that signs up within your application. An account can have multiple users associated with it and users can have multiple accounts. We recommend you to put all your resources under accounts instead of users. This is to support multi-tenancy and team accounts.

#### For the current signed-in account, this helper is available:
```ruby
current_account
```
#### Generate a new resource
```bash
$ rails generate model project account:references
```

## Views
A list of important Kiqr views and endpoints:

| Helper method | Method | URI Pattern | Description |
| --- | --- | --- | --- |
| `accounts_path` | GET | /accounts | Shows a list of accounts available for the user |
| `account_switch_path(:id)` | GET | /accounts/:id/switch | Let the user switch to another account |

## Templating

##### Generate a dropdown menu with links available for a signed in user:
```html+erb
<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
<% kiqr_user_dropdown.each do |link| %>
  <%= link_to link[:label], link[:path], class: 'dropdown-item' %>
<% end %>
</div>
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
