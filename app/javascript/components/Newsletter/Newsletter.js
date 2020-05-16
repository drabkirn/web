import React, { useState } from 'react';
import { Link } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";

import MainHeader from '../Shared/MainHeader';
import Footer from '../Shared/Footer';
import { addContactToOurNewsletterList } from '../../store/actions/newsletterActions';

function Newsletter() {
  const [email, setEmail] = useState();
  const [firstName, setfirstName] = useState();

  // Get the Redux state
  const store = useSelector(store => store);
  const subscribeStatus = store.newsletter.subscribeStatus;
  const subscribeData = store.newsletter.subscribeData;
  const subscribeError = store.newsletter.err;

  // Get the Redux Dispatch
  const dispatch = useDispatch();

  return (
    <React.Fragment>
      
      <MainHeader hasTag={false} pageName="Newsletter" shortDescription="We had to work a lot on making a free newsletter for you. We shoot you a mail once in a week on everything drabkirn." />

      <section className="container mt-50">
        <div className="align-center">
          <h2>Subscribe to our newsletter</h2>
          <u className="u-gold fs-1-2 italic">You've got nothing to worry about; you can read our <Link to="/legal/privacy_policy">privacy policy</Link> on how we handle your data. TLDR: We won't spam you or sell this data to any third party.</u>
        </div>

        <div className="mt-20 align-center-flex-vh">
          <form className="form-tag" onSubmit={ (e) => {
                e.preventDefault();
                const csrfToken = document.querySelector('[name="csrf-token"]').getAttribute('content');
                dispatch(addContactToOurNewsletterList(csrfToken, firstName, email))
              }
            }>
            <div className="form-field">
              <label htmlFor="first_name" className="form-field-label">First Name: </label>
              <p className="form-field-explanation">We collect your first name to refer to you on our emails. We won't let anyone know that you've subscribed to us. Name must have a minimum of 4 characters and a maximum of 20 characters.</p>
              <input type="text" className="form-field-input" id="first_name" required minLength="4" maxLength="20" onChange={ (e) => setfirstName(e.target.value) } />
            </div>

            <div className="form-field">
              <label htmlFor="email" className="form-field-label">Email: </label>
              <p className="form-field-explanation">Make sure you provide your correct email address, this is the only way we can communicate with you. Don't worry, you can anytime unsubscribe from us from the footer section of any of our email. It's that simple.</p>
              <input type="email" className="form-field-input" id="email" required onChange={ (e) => setEmail(e.target.value) } />
            </div>

            {
              subscribeStatus ? (
                <React.Fragment>
                  <div className="jumbo jumbo-success">
                    <p>{ subscribeData.message }</p>
                  </div>
                </React.Fragment>
              ) : ""
            }
            
            {
              subscribeError ? (
                <React.Fragment>
                  <div className="jumbo jumbo-error">
                    <p>{ subscribeError.message }.</p>
                  </div>
                </React.Fragment>
              ) : ""
            }
            
            <div className="align-center mt-40">
              <button className="btn btn-wide btn-rev">Subscribe</button>
            </div>
          </form>
        </div>

        <div className="align-center mt-40">
          <a href="https://go.cdadityang.xyz/nlif" className="fs-1" target="_blank" rel="noopener noreferrer">We understand things sometimes break, anyways click here if the above form doesn't work.</a>
        </div>
      </section>

      <section className="container mt-40">
        <div className="align-center">
          <Link to={"/"} className="btn btn-wide">Back</Link>
        </div>
      </section>

      <Footer />
    </React.Fragment>
  );
}

export default Newsletter;
