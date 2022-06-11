# frozen_string_literal: true

module Api
  module V1
    class PlacesController < Api::V1::BaseController
      def index
        client = GooglePlaces::Client.new(ENV['GMAPS_API_KEY'])
        places = client.spots_by_query(params[:search], types: %w[restaurant food])
        map_state = MapState.new
        map_state.places = map_places(places)
        map_state.markers = map_markers(places)
        map_state.center = map_center(places)
        map_state.zoom = map_zoom(places.count)
        respond_with map_state
      end

      private

      def map_places(places)
        favorite_places = FavoritePlace.where(user_id: user_id)
        places.map do |place|
          {
            id: place.id,
            place_id: place.place_id,
            name: place.name,
            address: place.formatted_address,
            rating: place.rating,
            price_level: place.price_level,
            photo_url: place_photo_url(place),
            is_favorite: favorite_places.any? { |fp| fp.place_id == place.place_id }
          }
        end
      end

      def place_photo_url(place)
        return '' if place.nil? || place.photos.empty?

        "https://maps.googleapis.com/maps/api/place/photo?photo_reference=#{place.photos[0].photo_reference}&maxheight=75&key=#{ENV['GMAPS_API_KEY']}"
      end

      def map_markers(places)
        places.map do |place|
          {
            id: place.id,
            lat: place.lat,
            lng: place.lng,
            name: place.name,
            address: place.formatted_address
          }
        end
      end

      def map_zoom(count)
        if count.zero?
          0
        elsif count == 1
          14
        else
          12
        end
      end

      def map_center(places)
        if places.count.zero?
          [35.6762, 139.6503] # Tokyo
        elsif places.count == 1
          [places[0].lat, places[0].lng]
        else
          avg_lat = 0
          avg_lon = 0
          places.map do |place|
            avg_lat += place.lat
            avg_lon += place.lng
          end
          [(avg_lat / places.count), (avg_lon / places.count)]
        end
      end
    end
  end
end
