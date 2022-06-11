import React from "react"
import PropTypes from "prop-types"
class Place extends React.Component {

  constructor(props) {
    super(props);
    // This binding is necessary to make `this` work in the callback
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    $.getJSON('/api/v1/favorites/toggle.json?place_id=' + this.props.place.place_id, (response) => {
      if ($(e.target).hasClass('fa-solid')) {
        $(e.target).removeClass('fa-solid');
        $(e.target).addClass('fa-regular');
      } else {
        $(e.target).addClass('fa-solid');
        $(e.target).removeClass('fa-regular');
      }
    });
  }

  render() {
    console.log(this.props.place)
    var icon_class = "fa-regular fa-heart"
    if (this.props.place.is_favorite) {
      icon_class = "fa-solid fa-heart"
    }
    return (
      <div class="container place-item">
        <div class="favorite" onClick={(e) => this.handleClick(e)}>
          <i class={icon_class} ></i>
        </div>
        <div class="row place-name">
          <em><strong>{this.props.place.name}</strong></em>
        </div>
        <div class="row">
          <div class="col-md-6 place-image">
            <img src={this.props.place.photo_url} />
          </div>
          <div class="col-md-6">
            Rating: {this.props.place.rating}<br/>
            Price: {this.props.place.price_level}
          </div>
        </div>
      </div>
    );
  }
}

export default Place