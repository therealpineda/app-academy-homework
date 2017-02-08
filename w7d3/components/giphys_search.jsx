import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      searchTerm: ""
    }
  }

  handleChange(event) {
    event.preventDefault();
    this.setState({searchTerm: event.target.value})
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
    this.setState({searchTerm: ""})
  }

  render() {
    return (
      <div id="giphy-search">
        <form onSubmit={ this.handleSubmit.bind(this) }>
          <label>Search GIFs: </label>
          <input
            type="text"
            onChange={ this.handleChange.bind(this) }
            value={this.state.searchTerm}/>
          <br />
          <input type="submit" value="Submit" />
        </form>
        <GiphysIndex giphys={ this.props.giphys } />
      </div>
    )
  }
};

export default GiphysSearch;
