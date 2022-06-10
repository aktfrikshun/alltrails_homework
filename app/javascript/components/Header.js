import React from "react"
import PropTypes from "prop-types"
import Search from "./Search"
class Header extends React.Component {
  render () {
    return (
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
            <a class="navbar-brand" href="#"><h2>AllTrails at Lunch</h2></a>
            <Search />
          </div>
      </nav>
    );
  }
}

export default Header
