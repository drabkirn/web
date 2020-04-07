import React from 'react';
import { Route, Switch } from 'react-router-dom';

import Home from './Home/Home';

import 'desityle/build/css/desityle.min.css';
import './App.css';

function App() {
  return (
    <Switch>
      <Route path="/" component={ Home } />
    </Switch>
  );
}

export default App;