# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    name { Faker::Company.name }
    billing_email { "#{Faker::Internet.unique.user_name}@mail.com" }
  end
end
