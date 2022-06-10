import React from "react"
import PropTypes from "prop-types"
class Search extends React.Component {

  render () {
    return (
      <div class="search-area">
        <form action="/places" method="POST" >
          <input name="search" placeholder="Search for lunch" />
          <input type="submit" value="Search" />
        </form>
      </div>
    );
  }
}

export default Search