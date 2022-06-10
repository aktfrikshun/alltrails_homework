import React from "react"
import PropTypes from "prop-types"
class Place extends React.Component {
  render () {
    return (
      <div class="place-item">
       <h2>{this.props.place.name}</h2>
       {this.props.place.formatted_address}
      </div>
    );
  }
}

export default Place