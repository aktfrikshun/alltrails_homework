import React from "react"
import PropTypes from "prop-types"
import Places from "./Places"
import Map from "./Map"
class Body extends React.Component {

  state = { map_state: {places: [], markers: [], center: [0,0], zoom: 0} }

  componentDidMount() {
    $.getJSON('/api/v1/places.json?search=' + this.props.search, (response) => { this.setState({ map_state: response }) });
  }

  render () {
    return (
      <div>
        <Places places={this.state.map_state["places"]} />
        <div class="map-area">
          <Map markers={[this.state.map_state["markers"]]} center={this.state.map_state["center"]} zoom={this.state.map_state["zoom"]} />
        </div>
      </div>
    );
  }
}

export default Body