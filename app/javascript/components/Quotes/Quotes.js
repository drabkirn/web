import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useSelector, useDispatch } from "react-redux";
import queryString from 'query-string';

import MainHeader from '../Shared/MainHeader';
import Footer from '../Shared/Footer';
import Pagination from './Pagination';
import QuoteCard from './QuoteCard';
import { fetchAllQuotes } from '../../store/actions/quoteActions';

function Quotes(props) {
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

  // Setting defaults for pagination
  const [currentPage, setCurrentPage] = useState(1);
  const [quotesPerPage] = useState(10);

  // Get the listings for quotes
  const indexOfLastQuote = currentPage * quotesPerPage;
  const indexOfFirstQuote = indexOfLastQuote - quotesPerPage;

  // Show only first 10 quotes, then show pagination, so we slice the quotes
  let currentQuotes = [];
  if(allQuotes){
    currentQuotes = allQuotes.slice(indexOfFirstQuote, indexOfLastQuote);
  }

  // When user clicks on a paginate number, this will run.
  const paginate = (pageNumber) => {
    setCurrentPage(pageNumber);

    const paginationLiATags = document.querySelectorAll('.pagination li a');
    paginationLiATags.forEach((aTag) => aTag.className = "");
    paginationLiATags[pageNumber - 1].className = "pagination-active";

    window.location.href="#quotesintro";
  }

  // Search for `tag` query in the URL
  // If there is one, search for all quotes that has the particular tag
  // Then update the currentQuotes, pagination for the same
  const tagParam = queryString.parse(props.location.search).tag;
  let taggedQuotes;
  let tag;
  if(tagParam) {
    if(Array.isArray(tagParam)) {
      tag = tagParam[0];
    } else {
      tag = tagParam;
    }
    if(allQuotes){
      currentQuotes = [];
      taggedQuotes = [];
      allQuotes.forEach((quote) => {
        if(quote.tags.includes(tag)) taggedQuotes.push(quote);
      });
      currentQuotes = taggedQuotes.slice(indexOfFirstQuote, indexOfLastQuote);
    }
  }

  return (
    <React.Fragment>
      <MainHeader hasTag={false} pageName="Quotes" shortDescription="We write thoughts in the form to redefine inspiration in a few words. Change your mindset to achieve more, get inspired, and improve your life along with us." />

      <section className="container">
        <div>
          <p>We usually release a new quote once a week, but in case we are very imaginative, we may come up with a couple of them per week. If you wish to, we've also set up an API so that you can integrate our quotes in your applications. You should <a href="/docs#quotes">check out our docs</a> on how to use our API.</p>

          <hr className="hr-center" />

          {
            tagParam ? (
              <p id="quotesintro">
                Anyways, enough of the introduction; Here are all the quotes with tag <b><em>"{ tag }"</em></b> straight from our database <em>(Click on a quote card to see more and don't forget to share)</em>
              </p>
            ) : (
              <p id="quotesintro">
                Anyways, enough of the introduction; Here are all the quotes straight from our database <em>(Click on a quote card to see more and don't forget to share)</em>
              </p>
            )
          }
        </div>

        <div className="row mt-30">
          {
            currentQuotes && currentQuotes.map((quote) => {
              return(
                <React.Fragment key={ quote.id }>
                  <QuoteCard
                    quoteId={ quote.id }
                    quoteTitle={ quote.title }
                    quoteContent={ quote.content } />
                </React.Fragment>
              )
            })
          }
          
          {
            allQuotesError ? (
              <div className="mt-20">
                <div className="jumbo jumbo-error mt-30">
                  <p>{ allQuotesError.message }</p>
                </div>
              </div>
            ) : ("")
          }
        </div>

        <div>
          {
            tagParam ? (
              <Pagination quotesPerPage={quotesPerPage} totalQuotes={taggedQuotes && taggedQuotes.length} tag={tag} paginate={paginate} />
            ) : (
              <Pagination quotesPerPage={quotesPerPage} totalQuotes={allQuotes && allQuotes.length} paginate={paginate} />
            )
          }
        </div>
      </section>

      <section className="container">
        <div className="align-center">
          {
            tagParam ? (
              <Link to={"/quotes"} className="btn btn-wide">All Quotes</Link>
            ) : ("")
          }
          <Link to={"/"} className="btn btn-wide">Back</Link>
        </div>
      </section>

      <Footer />
    </React.Fragment>
  );
}

export default Quotes;