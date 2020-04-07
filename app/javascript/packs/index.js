import React from 'react';
import ReactDOM from 'react-dom';
import { Router, BrowserRouter } from 'react-router-dom';
import history from '../history/history';
import PiwikReactRouter from 'piwik-react-router';

import App from '../components/App';

if(process.env.NODE_ENV === "production"){
  // Matomo/Piwik Setup
  const piwik = PiwikReactRouter({
    url: 'https://analytics.cdadityang.xyz',
    siteId: 3
  });

  document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <Router history={piwik.connectToHistory(history)}>
        <App />
      </Router>,
      document.getElementById('root')
    );
  });
} else{
  document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <BrowserRouter>
        <App />
      </BrowserRouter>,
      document.getElementById('root')
    );
  });
}