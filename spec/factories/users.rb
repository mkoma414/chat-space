require 'rails_helper'

FactoryGirl.define do

  factory :user do
    password = Faker::Internet.password(min_length = 8)

    name                  Faker::Name.name
    email                 Faker::Internet.email
    password              password
    password_confirmation password
    confirmed_at          DateTime.now

    after(:create) do |user|
      user.groups << create(:group)
    end
  end

end