# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Settings.users.password }
    password_confirmation { Settings.users.password }
  end
end
