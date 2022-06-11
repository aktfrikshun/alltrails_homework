import React from "react"
import PropTypes from "prop-types"
class Search extends React.Component {

  render () {
    return (
      <div class="col-sm-3 col-md-3 pull-right">
        <form class="d-flex" action="/places" method="POST">
          <input name="search" id="search-input" class="form-control me-2" type="search" placeholder="Search" aria-label="Search"></input>
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    );
  }
}

export default Search