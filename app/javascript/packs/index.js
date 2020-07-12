import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter } from 'react-router-dom';
// import history from '../includes/history';
// import ScrollToTop from '../includes/scrollToTop';
import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import thunk from 'redux-thunk';

import rootReducer from '../store/reducers/rootReducer';

import App from '../components/App';

import 'desityle/build/css/desityle.min.css';
import '../components/scss/custom.scss';

import 'desityle/build/js/desityle.min.js';
import '../components/custom';

const store = createStore(rootReducer, applyMiddleware(thunk));

document.addEventListener('DOMContentLoaded', () => {
  const docRoot = document.getElementById('root');

  if(docRoot) {
    ReactDOM.render(
      <Provider store={ store }>
        <BrowserRouter>
          {/* <ScrollToTop /> */}
          <App />
        </BrowserRouter>
      </Provider>,
      docRoot
    );
  }
});