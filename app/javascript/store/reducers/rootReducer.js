import newsletterReducer from './newsletterReducer';

import { combineReducers } from 'redux';

const rootReducer = combineReducers({
  newsletter: newsletterReducer
});

export default rootReducer;