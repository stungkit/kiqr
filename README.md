
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
- [dry-configurable](https://github.com/dry-rb/dry-configurable) - A simple mixin to make Ruby classes configurable

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
```bash
$ rails generate kiqr::install user
```

## The account model

Kiqr will create a default account for each user that signs up within your application. An account can have multiple users associated with it and a user can have multiple accounts.

#### For the current signed-in account, this helper is available globally:
```ruby
current_account
```

#### Switching between accounts
Add ```accounts_path``` to your navigation to link to the account switching page, or when building a customized account switcher, redirect your user to:
```ruby
switch_account_path(:id)
```

## Models
We recommend you to put all your resources under accounts instead of users. This is to support multi-tenancy and team accounts.

#### Generate a new resource
```bash
$ rails generate model project account:references
```

## Controllers

### Securing controllers
To set up a controller with user authentication, just add this before_action (assuming you're using Devise and your model is 'User'):
```ruby
before_action :authenticate_user!
```

## Views

### Snippets & examples

#### Account switcher dropdown
```html+erb
<div class="dropdown-menu">
<% current_user.accounts.each do |account| %>
  <%= link_to account.name, switch_account_path(account), method: :patch %>
<% end %>
</div>
```

## Routes
A list of all reserved Kiqr endpoints:

| Prefix | Method | URI | Controller#Action | Description |
| --- | --- | --- | --- | --- |
| `accounts_path` | GET | /accounts | accounts#index | List accounts available for the signed in user |
| `switch_account_path(:id)` | PATCH/GET | /accounts/:id/switch | accounts#switch | Let the user switch to another account |

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
