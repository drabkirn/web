// Add frontend error to DB - POST /feerrors
export const reportFeError = (csrfToken, title, body) => {
  return (dispatch) => {
    const myHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/drabkirn.web.v1',
      'User-Agent': 'Drabkirn : Web UI : https://drabkirn.cdadityang.xyz',
      'X-CSRF-Token': csrfToken
    };

    const myBody = {
      "feerror" : {
        "title": title,
        "body": body
      }
    };

    const feErrorURL = "/feerrors";
    
    fetch(feErrorURL, { method: 'POST', headers: myHeaders, body: JSON.stringify(myBody) })
      .then((response) => {
        return response.json();
      }).then((res) => {
        if(res.errors){
          dispatch({
            type: 'POST_ERROR_API_ERROR',
            err: res
          });
        } else {
          dispatch({
            type: 'POST_ERROR_SUCCESS',
            payload: res
          });
        }
      }).catch((err) => {
        dispatch({
          type: 'POST_ERROR_ERROR',
          err: {
            message: err
          }
        });
      });
  };
};