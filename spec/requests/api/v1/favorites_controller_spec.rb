# frozen_string_literal: true

require 'rails_helper'

# Inspired by https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one#toc-controllers

RSpec.describe 'Favorites API', type: :request do
  describe 'GET /favorites/toggle' do
    let(:favorites_path) { '/api/v1/favorites/toggle.json' }
    let(:place_id) { SecureRandom.uuid }

    context 'public access' do
      it 'can toggle a user favorite' do
        get favorites_path, params: { place_id: place_id }
        expect(FavoritePlace.find_by(place_id: place_id)).to be_present
        get favorites_path, params: { place_id: place_id }
        expect(FavoritePlace.find_by(place_id: place_id)).to be_nil
      end
    end
  end
end
