# frozen_string_literal: true

module Api
  module V1
    class FavoritesController < Api::V1::BaseController
      def toggle
        fp = FavoritePlace.find_by(user_id: user_id, place_id: params[:place_id])
        if fp.nil?
          respond_with FavoritePlace.create(user_id: user_id, place_id: params[:place_id])
        else
          respond_with fp.destroy
        end
      end
    end
  end
end
