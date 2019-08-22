# frozen_string_literal: true

FactoryBot.define do
  factory :policy do
    name { Faker::Internet.username }

    trait :administrator_access do
      name { 'AdministratorAccess' }
    end
  end
end
