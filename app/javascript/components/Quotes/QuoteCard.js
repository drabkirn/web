import React from 'react';
import { Link } from 'react-router-dom';

import { DRABKRIN_QUOTES_BASE_URL } from '../Shared/Defaults';

import TwitterIcon100x100 from 'images/icons/social/if-twitter-100x100.svg';
import WhatsAppIcon100x100 from 'images/icons/social/if-whatsapp-100x100.svg';
import FacebookIcon100x100 from 'images/icons/social/if-facebook-100x100.svg';
import LinkedInIcon100x100 from 'images/icons/social/if-linkedin-100x100.svg';

function QuoteCard(props) {
  const twitterCharLimit = 220;
  const twitterTruncatedText = textTruncate(props.quoteContent, twitterCharLimit);
  const facebookShareURL = `https://www.facebook.com/sharer/sharer.php?u=${DRABKRIN_QUOTES_BASE_URL}/${props.quoteId}`;
  const linkedinShareURL = `https://www.linkedin.com/sharing/share-offsite/?url=${DRABKRIN_QUOTES_BASE_URL}/${props.quoteId}`;

  const twitterShareURL = `https://twitter.com/intent/tweet?text=${ twitterTruncatedText }%0A&hashtags=drabkirn,quote&url=${DRABKRIN_QUOTES_BASE_URL}/${props.quoteId}&via=drabkirn`;

  const whatsAppShareURL = `https://api.whatsapp.com/send?text=${ props.quoteContent }%0A%0A See more at ${DRABKRIN_QUOTES_BASE_URL}`

  return (
    <React.Fragment>
      <div className="col-dsk-6 col-mob-12 mb-20 card-wrapper">
        <div className="card quotes-pink-color-bg">
          <div className="card-header align-center pb-5 quotes-card-header">
            <h5><Link to={ "/quotes/" + props.quoteId }>{props.quoteId}. { props.quoteTitle }</Link></h5>
          </div>

          <div className="card-content px-10 quotes-card-content">
            <p><Link to={ "/quotes/" + props.quoteId }>{ props.quoteContent }</Link></p>  
          </div>

          <div className="card-footer align-center pt-10 quotes-card-footer">
            <a className="a-image ml-15" href={ twitterShareURL } target="_blank" rel="noopener noreferrer"><img src={ TwitterIcon100x100 } alt="twtr-share-icon" /></a>
            <a className="a-image ml-15" href={ whatsAppShareURL } target="_blank" rel="noopener noreferrer"><img src={ WhatsAppIcon100x100 } alt="wapp-share-icon" /></a>
            <a className="a-image ml-15" href={ facebookShareURL } target="_blank" rel="noopener noreferrer"><img src={ FacebookIcon100x100 } alt="fb-share-icon" /></a>
            <a className="a-image ml-15" href={ linkedinShareURL } target="_blank" rel="noopener noreferrer"><img src={ LinkedInIcon100x100 } alt="linkedin-share-icon" /></a>
          </div>
        </div>
      </div>

      </React.Fragment>
  );
}

function textTruncate(text, textLimit) {
  if(text.length > textLimit) {
    return text.substring(0, textLimit) + "...";
  } else {
    return text;
  }
}

export default QuoteCard;