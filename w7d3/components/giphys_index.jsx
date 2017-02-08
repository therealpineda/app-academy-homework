import React, { Component } from 'react';
import GiphyIndexItem from './giphy_index_item';

const GiphysIndex = ( {giphys} ) => {
  const giphyItems = giphys.map((giphy, idx) => {
    return (
      <GiphyIndexItem key={idx} giphy={giphy} />
    );
  })
  return (
    <div>
      { giphyItems }
    </div>
  );
};

export default GiphysIndex;
