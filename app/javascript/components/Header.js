import React from "react"
import PropTypes from "prop-types"
import Search from "./Search"
class Header extends React.Component {
  render () {
    return (
      <div>
        <h1>AllTrails at Lunch</h1>
        <Search />
      </div>
    );
  }
}

export default Header
