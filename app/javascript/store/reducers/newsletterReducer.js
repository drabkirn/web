let initState = {
  subscribeStatus: false,
  subscribeData: null,
  err: null
};

const newsletterReducer = (state = initState, action) => {
switch (action.type){
  case 'POST_NEWSLETTER_SUBSCRIBE_SUCCESS':
    return {
      ...state,
      subscribeStatus: true,
      subscribeData: action.payload.data,
      err: null
    };
  case 'POST_NEWSLETTER_SUBSCRIBE_API_ERROR':
    return {
      ...state,
      err: action.err.error ? action.err.error : action.err.errors,
      subscribeStatus: false,
      subscribeData: null
    };
  case 'POST_NEWSLETTER_SUBSCRIBE_ERROR':
    return {
      ...state,
      err: action.err.message,
      subscribeStatus: false,
      subscribeData: null
    };
  default:
    return state;
  }
};

export default newsletterReducer;