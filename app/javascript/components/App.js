import React from 'react';
import { Route, Switch } from 'react-router-dom';

import Home from './Home/Home';
import Newsletter from './Newsletter/Newsletter';
import Palace from './Palace/Palace';
import Authna from './Authna/Authna';
import Quotes from './Quotes/Quotes';
import Quote from './Quotes/Quote';

import 'desityle/build/css/desityle.min.css';
import './App.css';

function App() {
  return (
    <Switch>
      <Route exact path="/newsletter" component={ Newsletter } />
      <Route exact path="/palace" component={ Palace } />
      <Route exact path="/authna" component={ Authna } />
      <Route exact path="/quotes/:id" component={ Quote } />
      <Route exact path="/quotes" component={ Quotes } />
      <Route path="/" component={ Home } />
    </Switch>
  );
}

export default App;