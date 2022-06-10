# frozen_string_literal: true

class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
end
