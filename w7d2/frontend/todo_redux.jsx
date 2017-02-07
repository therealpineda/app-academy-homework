import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  // store.dispatch = addLoggingtoDispatch(store);
  // bad pattern to just overwrite the store.dispatch
  // use middleware function as below instead:
    // store = applyMiddleware(store, [addLoggingtoDispatch]);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// const addLoggingtoDispatch = store => next => action => {
//     console.log(store.getState());
//     console.log(action);
//     next(action);
//     console.log(store.getState());
// };
//
// const applyMiddleware = (store, middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };
