# frozen_string_literal: true

require 'rails_helper'

# Inspired by https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one#toc-controllers

RSpec.describe 'Places API', type: :request do
  describe 'GET /places' do
    let(:places_path) { '/api/v1/places.json' }

    context 'public access' do
      before do
        get places_path
        expect(response).to have_http_status(:ok)
        data = JSON.parse(response.body)
        @places = data['places']
        expect(@places.size).to be > 0
      end

      it 'returns places without favorites' do
        favorites = @places.select { |place| place['is_favorite'] == true }
        expect(favorites.size).to eq(0)
      end

      it 'returns places with favorites' do
        FavoritePlace.create(user_id: cookies['user_id'], place_id: @places[0]['place_id'])
        get places_path
        data = JSON.parse(response.body)
        places = data['places']
        favorites = places.select { |place| place['is_favorite'] == true }
        expect(favorites.size).to eq(1)
      end
    end
  end
end
