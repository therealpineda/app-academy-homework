import React from 'react';

const GiphyIndexItem = ( {giphy} ) => {
  // debugger
  return (
    <img src={giphy.images.fixed_height_small.url} />
  )
};

export default GiphyIndexItem;
