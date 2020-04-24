import React from 'react';
import ReactDOM from 'react-dom';
import { Router, BrowserRouter } from 'react-router-dom';
import history from '../history/history';
import PiwikReactRouter from 'piwik-react-router';
import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import thunk from 'redux-thunk';

import rootReducer from '../store/reducers/rootReducer';

import App from '../components/App';

import 'desityle/build/css/desityle.min.css';
import '../components/custom.css';

import 'desityle/build/js/desityle.min.js';
import '../components/custom';

const store = createStore(rootReducer, applyMiddleware(thunk));

if(process.env.NODE_ENV === "production"){
  // Matomo/Piwik Setup
  const piwik = PiwikReactRouter({
    url: 'https://analytics.cdadityang.xyz',
    siteId: 3
  });

  document.addEventListener('DOMContentLoaded', () => {
    const docRoot = document.getElementById('root');

    if(docRoot) {
      ReactDOM.render(
        <Provider store={ store }>
          <Router history={piwik.connectToHistory(history)}>
            <App />
          </Router>
        </Provider>,
        docRoot
      );
    }
  });
} else {
  document.addEventListener('DOMContentLoaded', () => {
    const docRoot = document.getElementById('root');

    if(docRoot) {
      ReactDOM.render(
        <Provider store={ store }>
          <BrowserRouter>
            <App />
          </BrowserRouter>
        </Provider>,
        docRoot
      );
    }
  });
}