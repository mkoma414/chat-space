require 'rails_helper'

FactoryGirl.define do

  factory :user do
    name                  "komatsubara"
    email                 "m-koma@nifty.com"
    password              "password"
    password_confirmation "password"
    confirmed_at          "2017-03-24 16:30:30"

    after(:create) do |user|
      user.groups << create(:group)
    end
  end

end