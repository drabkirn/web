// Get all the Quotes - GET /quotes
export const fetchAllQuotes = () => {
  return (dispatch) => {
    let myHeaders = {
      'Content-Type': 'application/json',
      'User-Agent': 'Drabkirn Web : Website : NA',
      'Accept': 'application/drabkirn.web.v1'
    };
    
    fetch('/quotes', { method: 'GET', headers: myHeaders })
      .then((response) => {
        return response.json();
      }).then((res) => {
        if(res.errors){
          dispatch({
            type: 'GET_ALL_QUOTES_API_ERROR',
            err: res
          });
        } else {
          dispatch({
            type: 'GET_ALL_QUOTES_SUCCESS',
            payload: res
          });
        }
      }).catch((err) => {
        dispatch({
          type: 'GET_ALL_QUOTES_ERROR',
          err: {
            message: err
          }
        });
      });
  };
};