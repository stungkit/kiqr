
Kiqr
==============

[![RuboCop Github Action](https://github.com/kiqr/kiqr/actions/workflows/rubocop.yml/badge.svg)](https://github.com/kiqr/kiqr/actions/workflows/rubocop.yml)
[![Gem Version](https://badge.fury.io/rb/kiqr.svg)](https://badge.fury.io/rb/kiqr)
[![kiqr_core](https://github.com/kiqr/kiqr/actions/workflows/kiqr_core.yml/badge.svg)](https://github.com/kiqr/kiqr/actions/workflows/kiqr_core.yml)
[![kiqr_devise](https://github.com/kiqr/kiqr/actions/workflows/kiqr_devise.yml/badge.svg)](https://github.com/kiqr/kiqr/actions/workflows/kiqr_devise.yml)

**Kiqr** is an open-source framework for creating SaaS applications with Ruby on Rails.

**If you're new to Kiqr, we strongly recommend you to start with our pre-configured app [kiqr_starter](https://github.com/kiqr/kiqr_starter).**

#### Whats included?
- Multi-user team/organization logic that let you share resources between users in a team

#### Requirements

- Ruby 2.7 or higher
- Rails 6.0.3 or higher
- Devise or any other authentication gem installed and configured for model ```User```

#### Included dependencies

Kiqr comes bundled with some third-party Ruby Gems. These are all well tested and receives regular security updates allowing you to focus on your own code:
- [cancancan](https://github.com/CanCanCommunity/cancancan) - Authorization for roles and subscription plans.
- [dry-configurable](https://github.com/dry-rb/dry-configurable) - A simple mixin to make Ruby classes configurable.
- [valid_email2](https://github.com/micke/valid_email2) - ActiveModel validation for email. Including MX lookup and disposable email blacklist.
- [simple_form](https://github.com/heartcombo/simple_form) - Simple generation of forms that you can configure in your template.

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
When building your customized account switcher, redirect your user to the ```switch_account_path```. For example: 
```html+erb
<div class="dropdown-menu">
<% current_user.accounts.each do |account| %>
  <%= link_to account.name, switch_account_path(account), method: :patch %>
<% end %>
</div>
```

#### Generate a new resource
We recommend you to put all your resources under accounts instead of users. This is to support multi-tenancy and team accounts.
```bash
$ rails generate model project account:references
```

## Routes

### Configuring routes
Kiqr ships with default routes. If you need to customize them, you should probably be able to do it through the kiqr_routes method. It accepts several options like ```path:``` and so on, including the possibility to change path names for I18n:

To rename the ```/account``` scope to ```/organization``` you can use the ```path:``` option:
```ruby
kiqr_routes path: 'organization'
```

#### A list of all available default views:

| Prefix | Method | Default URI | Description |
| --- | --- | --- | --- |
| `new_account_path` | GET | /account/new | Create an account |
| `edit_account_path` | GET | /account/edit | Account settings |
| `setup_account_path` | GET | /account/setup | Setup the default account |
| `switch_account_path(:id)` | GET/PATCH | /account/:id/switch | Switch to another account |
| `members_path` | GET | /account/members | List of account members (users) |

## Use with ``turbo-rails``
Add the following to your Gemfile until Responders gem is published with version >= 3.0.2. 
```ruby
gem 'responders', git: 'https://github.com/heartcombo/responders'
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
