import React from "react"
import PropTypes from "prop-types"
class Place extends React.Component {

  render () {
    return (
      <div class="place-item">
        <div class="favorite" onClick="this.handleClick"><i class="fa-regular fa-heart"></i></div>
        <em><strong>{this.props.place.name}</strong></em><br/>
        Rating: {this.props.place.rating}<br/>
        Price: {this.props.place.price_level}<br/>
      </div>
    );
  }
}

export default Place