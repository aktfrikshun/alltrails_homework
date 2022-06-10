import React from "react"
import PropTypes from "prop-types"
import Place from "./Place"
class Places extends React.Component {
  render() {
      var places= this.props.places.map((place) => {
          return (
              <div key={place.id}>
                  <Place place={place} />
              </div>
          )
      });

      return(
          <div class="places-area">
              {places}
          </div>
      )
  }
}

export default Places