// Add Contact to our Newsletter List - POST /newsletter/subscribe
export const addContactToOurNewsletterList = (csrfToken, firstName, email) => {
  return (dispatch) => {
    const myHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/drabkirn.web.v1',
      'User-Agent': 'Drabkirn : Web UI : https://drabkirn.cdadityang.xyz',
      'X-CSRF-Token': csrfToken
    };

    const myBody = {
      "firstName": firstName,
      "email": email
    };

    const newsletterURL = "/newsletter/subscribe";
    
    fetch(newsletterURL, { method: 'POST', headers: myHeaders, body: JSON.stringify(myBody) })
      .then((response) => {
        return response.json();
      }).then((res) => {
        if(res.errors){
          dispatch({
            type: 'POST_NEWSLETTER_SUBSCRIBE_API_ERROR',
            err: res
          });
        } else {
          dispatch({
            type: 'POST_NEWSLETTER_SUBSCRIBE_SUCCESS',
            payload: res
          });
        }
      }).catch((err) => {
        dispatch({
          type: 'POST_NEWSLETTER_SUBSCRIBE_ERROR',
          err: {
            message: err
          }
        });
      });
  };
};