# frozen_string_literal: true

FactoryBot.define do
  factory :favorite_place do
    id { 1 }
    user_id { SecureRandom.uuid }
    place_id { SecureRandom.uuid }
  end
end
