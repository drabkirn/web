import newsletterReducer from './newsletterReducer';
import quoteReducer from './quoteReducer';
import feErrorReducer from './feErrorReducer';

import { combineReducers } from 'redux';

const rootReducer = combineReducers({
  newsletter: newsletterReducer,
  quote: quoteReducer,
  feError: feErrorReducer
});

export default rootReducer;