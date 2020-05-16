import React, { useEffect } from 'react';
import { Link, Redirect } from 'react-router-dom';
import { Helmet } from "react-helmet";
import { useSelector, useDispatch } from "react-redux";

import MainHeader from '../Shared/MainHeader';
import Footer from '../Shared/Footer';
import { DRABKRIN_QUOTES_BASE_URL } from '../Shared/Defaults';
import { fetchAllQuotes } from '../../store/actions/quoteActions';

import TwitterIcon100x100 from 'images/icons/social/if-twitter-100x100.svg';
import WhatsAppIcon100x100 from 'images/icons/social/if-whatsapp-100x100.svg';
import FacebookIcon100x100 from 'images/icons/social/if-facebook-100x100.svg';
import LinkedInIcon100x100 from 'images/icons/social/if-linkedin-100x100.svg';
import QuotesOgImage from 'images/og_images/quotes.png';

function Quote(props) {
  const quoteId = parseInt(props.match.params.id);
  if(!quoteId){
    return <Redirect to="/quotes" />;
  }

  // Get the Redux state
  const store = useSelector(store => store);

  const allQuotes = store.quote.quotes;
  const allQuotesError = store.quote.err;

  // Get the Redux Dispatch
  const dispatch = useDispatch();

  // React Hook for ComponentDidMount
  useEffect(() => {
    if(!allQuotes) {
      dispatch(fetchAllQuotes());
    }
  }, []);

  if(allQuotes) {
    const allQuotesLength = allQuotes.length;
    if(quoteId < 0 || quoteId > allQuotesLength) return <Redirect to="/quotes" />;
  }

  let formattedPubDate;
  if(allQuotes && allQuotes[quoteId - 1]) {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    const pubDate = new Date((allQuotes[quoteId - 1]).created_at)
    formattedPubDate = pubDate.toLocaleDateString("en-US", options);
  }

  // Sharing URLS
  const twitterCharLimit = 220;
  let twitterTruncatedText;
  let twitterShareURL;
  let whatsAppShareURL;
  const facebookShareURL = `https://www.facebook.com/sharer/sharer.php?u=${DRABKRIN_QUOTES_BASE_URL}/${quoteId}`;
  const linkedinShareURL = `https://www.linkedin.com/sharing/share-offsite/?url=${DRABKRIN_QUOTES_BASE_URL}/${quoteId}`;
  if(allQuotes && allQuotes[quoteId - 1]) {
    twitterTruncatedText = textTruncate(allQuotes[quoteId - 1].content, twitterCharLimit); 
    twitterShareURL = `https://twitter.com/intent/tweet?text=${ twitterTruncatedText }%0A&hashtags=drabkirn,quote&url=${DRABKRIN_QUOTES_BASE_URL}/${quoteId}&via=drabkirn`;
    whatsAppShareURL = `https://api.whatsapp.com/send?text=${ allQuotes[quoteId - 1].content }%0A%0A See more at ${DRABKRIN_QUOTES_BASE_URL}`;
  }

  // Meta tags
  const MetaTitle = `${quoteId}. ${allQuotes && allQuotes[quoteId - 1].title} | Quotes | Drabkirn`;
  const MetaDescription = `Quote ${quoteId}: ${allQuotes && allQuotes[quoteId - 1].content}`;
  const MetaKeywords = "drabkirn, drab, quotes, drabkirn quotes, drab quotes, quote, quotes, quotes api, inspire, mindset, life";
  const MetaAppURL = "https://drabkirn.cdadityang.xyz/quotes";
  const MetaSiteName = "Quotes";

  const MetaAppURLDefault = "https://drabkirn.cdadityang.xyz";

  return (
    <React.Fragment>
      <Helmet>
        <title>{ MetaTitle }</title>

        <meta name="description" content={ MetaDescription } />
        <meta name="keywords" content={ MetaKeywords } />

        {/* Facebook Meta */}
        <meta property="og:url" content={ MetaAppURL } />
        <meta property="og:image" content={ MetaAppURLDefault + QuotesOgImage } />
        <meta property="og:description" content={ MetaDescription } />
        <meta property="og:title" content={ MetaTitle } />
        <meta property="og:site_name" content={ MetaSiteName } />
        <meta property="og:see_also" content={ MetaAppURLDefault } />

        {/* G+ Meta tags */}
        <meta itemprop="name" content={ MetaTitle } />
        <meta itemprop="description" content={ MetaDescription } />
        <meta itemprop="image" content={ MetaAppURLDefault + QuotesOgImage } />

        {/* Twitter Meta Tags */}
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:url" content={ MetaAppURL } />
        <meta name="twitter:title" content={ MetaTitle } />
        <meta name="twitter:description" content={ MetaDescription } />
        <meta name="twitter:image" content={ MetaAppURLDefault + QuotesOgImage } />
      </Helmet>

      <MainHeader hasTag={false} pageName="Quotes" shortDescription="We write thoughts in the form to redefine inspiration in a few words. Change your mindset to achieve more, get inspired, and improve your life along with us." />

      <section className="container mt-50" id="quoteShow">
        <div>
          {
            allQuotesError ? (
              <React.Fragment>
                <div className="jumbo jumbo-error">
                  <p>{ allQuotesError.message }</p>
                </div>
              </React.Fragment>
            ) : (
              <React.Fragment>
                <div className="align-center">
                  <h4><u className="u-quotes-pink">{ quoteId }. { allQuotes && allQuotes[quoteId - 1].title }</u></h4>
                </div>

                <div>
                  <blockquote className="blockquote-quotes-pink">{allQuotes && allQuotes[quoteId - 1].content}</blockquote>
                </div>

                <div className="align-right">
                  <p className="italic bold badgetag badgetag-quotes-pink">- { allQuotes && allQuotes[quoteId - 1].author }</p>
                </div>

                <div className="mt-30 align-center-on-mob-only">
                  <p className="badgetag badgetag-orange">Published on: { formattedPubDate && formattedPubDate }</p>
                </div>

                <div className="align-center mt-50">
                  {
                    allQuotes && allQuotes[quoteId - 1].tags.map((tag) => {
                      return (
                        <p className="badgetag badgetag-quotes-pink" key={tag}><Link to={"/quotes?tag=" + tag}>{ tag }</Link></p>
                      );
                    })
                  }
                </div>
              </React.Fragment>
            )
          }
        </div>
      </section>

      <hr className="hr-center" />

      <section className="container">
        <div>
          <h2>Share em:</h2>
          <p>
            Hey, did you know, you can share our quotes directly from below, we save you from heavy-lifting COPY-PASTING them:
          </p>
        </div>

        <div className="align-center mt-40">
          <a className="a-image ml-15" href={ twitterShareURL } target="_blank" rel="noopener noreferrer"><img src={ TwitterIcon100x100 } alt="twtr-share-icon" /></a>
          <a className="a-image ml-15" href={ whatsAppShareURL } target="_blank" rel="noopener noreferrer"><img src={ WhatsAppIcon100x100 } alt="wapp-share-icon" /></a>
          <a className="a-image ml-15" href={ facebookShareURL } target="_blank" rel="noopener noreferrer"><img src={ FacebookIcon100x100 } alt="fb-share-icon" /></a>
          <a className="a-image ml-15" href={ linkedinShareURL } target="_blank" rel="noopener noreferrer"><img src={ LinkedInIcon100x100 } alt="linkedin-share-icon" /></a>
        </div>
      </section>

      <section className="container align-center mt-50">
        {
          quoteId === 1 ? ("") : (
            <Link to={`/quotes/${quoteId - 1}`} className="btn" onClick={(() => window.location.href="#quoteShow")}>&#60;==</Link>
          )}
          <Link to={"/quotes"} className="btn btn-wide">Back</Link>
          { !allQuotes ? ("") : (
            quoteId === allQuotes.length ? ("") : (
              <Link to={`/quotes/${quoteId + 1}`} className="btn" onClick={(() => window.location.href="#quoteShow")}>==&#62;</Link>
            )
          )
        }
      </section>

      <Footer />
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

export default Quote;