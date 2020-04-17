import newsletterReducer from './newsletterReducer';
import quoteReducer from './quoteReducer';

import { combineReducers } from 'redux';

const rootReducer = combineReducers({
  newsletter: newsletterReducer,
  quote: quoteReducer
});

export default rootReducer;