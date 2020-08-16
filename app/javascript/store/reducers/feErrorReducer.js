import { DRABKIRN_EMAIL } from "../../components/Shared/Defaults";

// Initial state
let initState = {
  data: null,
  pushingError: null,
  isFetching: true
};

const feErrorReducer = (state = initState, action) => {
  // Change the state as per actions it receives.
  switch (action.type){
    case 'POST_ERROR_SUCCESS':
      return {
        ...state,
        data: action.payload.data,
        isFetching: false
      };
    case 'POST_ERROR_API_ERROR':
      return {
        ...state,
        pushingError: action.err.error ? action.err.error : action.err.errors,
        isFetching: false
      };
    case 'POST_ERROR_ERROR':
      return {
        ...state,
        pushingError: `${ action.err.message }. Please consider sending an email to ${DRABKIRN_EMAIL} with all the details immediately.`,
        isFetching: false
      };
    default:
      return state;
  }
};


export default feErrorReducer;