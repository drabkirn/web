import React from 'react';
import { Link } from "react-router-dom";

import MainHeader from '../Shared/MainHeader';
import Footer from '../Shared/Footer';

function Authna() {
  return (
    <React.Fragment>
      <MainHeader hasTag={false} pageName="Authna" shortDescription="Plug and play user authentication system that we use at Drabkirn, and you can use it too." />

      <section className="container">
        <div>
          <p className="fs-1-6">Why re-create user's authentication in every app that you build? You can fire up an Authna server, configure your apps to use Authna, and get your users authenticated. Sweet and simple.</p>
        </div>
      </section>

      <section className="mt-50 mb-70">
        <div className="align-center">
          <a href="https://github.com/drabkirn/authna" className="btn wide-btn" target="_blank" rel="noopener noreferrer">GitHub</a>
          <br />
          <Link to="/" className="btn wide-btn">Back</Link>
        </div>
      </section>

      <Footer />
    </React.Fragment>
  );
}

export default Authna;
