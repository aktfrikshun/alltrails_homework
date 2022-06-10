import React from "react"
import PropTypes from "prop-types"
class Place extends React.Component {

  render () {
    var image_src = this.props.place.icon;
    console.log(this.props.place);
    return (
      <div class="place-item">
        <em><strong>{this.props.place.name}</strong></em><br/>
        Rating: {this.props.place.rating}<br/>
        Price: {this.props.place.price_level}
      </div>
    );
  }
}

export default Place