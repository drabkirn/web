import React from 'react';
import { Route, Switch } from 'react-router-dom';

import Home from './Home/Home';
import Newsletter from './Newsletter/Newsletter';

import 'desityle/build/css/desityle.min.css';
import './App.css';

function App() {
  return (
    <Switch>
      <Route exact path="/newsletter" component={ Newsletter } />
      <Route path="/" component={ Home } />
    </Switch>
  );
}

export default App;