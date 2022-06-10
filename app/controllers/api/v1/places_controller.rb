class Api::V1::PlacesController < Api::V1::BaseController
  def index
    @client = GooglePlaces::Client.new(ENV["GMAPS_API_KEY"])
    @places = @client.spots_by_query(params[:search], :types => ['restaurant', 'food'])
    @markers = @places.map do |place|
      {
        id: place.id,
        lat: place.lat,
        lng: place.lng,
        name: place.name,
        address: place.formatted_address
      }
    end

    if @places.count.zero?
      @map_center = [35.6762, 139.6503] # Tokyo
      @map_zoom = 0
    elsif @places.count == 1
      @map_center = [@places[0].lat, @places[0].lng]
      @map_zoom = 14
    else
      avg_lat = 0
      avg_lon = 0

      @places.map do |place|
        avg_lat += place.lat
        avg_lon += place.lng
      end

      @map_center = [(avg_lat / @places.count), (avg_lon / @places.count)]
      @map_zoom = 12
    end
    map_state = MapState.new
    map_state.places = @places
    map_state.markers = @markers
    map_state.center = @map_center
    map_state.zoom = @map_zoom
    respond_with map_state
  end

  def create
    respond_with :api, :v1, FavoritePlace.create(item_params)
  end

  def destroy
    respond_with FavoritePlace.destroy(params[:id])
  end

  private

  def place_params
    params.require(:place).permit(:id, :name)
  end
end