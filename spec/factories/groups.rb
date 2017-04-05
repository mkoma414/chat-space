require 'rails_helper'

FactoryGirl.define do

  factory :group do
    name  "group1"

    after(:create) do |group|
      group.messages << create(:message)
    end
  end

end