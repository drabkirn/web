import React from 'react';
import ReactDOM from 'react-dom';
import { Router, BrowserRouter } from 'react-router-dom';
import history from '../includes/history';
// import ScrollToTop from '../includes/scrollToTop';
import PiwikReactRouter from 'piwik-react-router';
import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import thunk from 'redux-thunk';
import { Notifier } from '@airbrake/browser';

import rootReducer from '../store/reducers/rootReducer';

import App from '../components/App';

import 'desityle/build/css/desityle.min.css';
import '../components/scss/custom.scss';

import 'desityle/build/js/desityle.min.js';
import '../components/custom';

const store = createStore(rootReducer, applyMiddleware(thunk));

if(process.env.NODE_ENV === "production"){
  // AIRBRAKE START
  const airbrake = new Notifier({
    projectId: 281210,
    projectKey: '01075522b3f0b01a3eca8eda58c948fb'
  });

  airbrake.addFilter((notice) => {
    notice.context.environment = process.env.RAILS_ENV;
    return notice;
  });

  try {
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
              {/* <ScrollToTop /> */}
              <App />
            </Router>
          </Provider>,
          docRoot
        );
      }
    });
  } catch (err) {
    airbrake.notify(err).then((notice) => {
      if (notice.id) {
        console.log('notice id:', notice.id);
      } else {
        console.log('notify failed:', notice.error);
      }
    });
  }
  // AIRBRAKE END
} else {
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
}