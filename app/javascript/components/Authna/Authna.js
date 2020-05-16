import React from 'react';
import { Link } from "react-router-dom";
import { Helmet } from "react-helmet";

import MainHeader from '../Shared/MainHeader';
import Footer from '../Shared/Footer';

import AuthnaOgImage from 'images/og_images/authna.png';

function Authna() {
  const MetaTitle = "Authna - Plug and play user authentication system | Drabkirn";
  const MetaDescription = "Why re-create user's authentication in every app that you build? You can fire up an Authna server, configure your apps to use Authna, and get your users authenticated. Sweet and simple.";
  const MetaKeywords = "drabkirn, drab, authna, drabkirn authna, drab authna, user authentication, authentication";
  const MetaAppURL = "https://drabkirn.cdadityang.xyz/authna";
  const MetaSiteName = "Authna";

  const MetaAppURLDefault = "https://drabkirn.cdadityang.xyz";

  return (
    <React.Fragment>
      <Helmet>
        <title>{ MetaTitle }</title>

        <meta name="description" content={ MetaDescription } />
        <meta name="keywords" content={ MetaKeywords } />

        {/* Facebook Meta */}
        <meta property="og:url" content={ MetaAppURL } />
        <meta property="og:image" content={ MetaAppURLDefault + AuthnaOgImage } />
        <meta property="og:description" content={ MetaDescription } />
        <meta property="og:title" content={ MetaTitle } />
        <meta property="og:site_name" content={ MetaSiteName } />
        <meta property="og:see_also" content={ MetaAppURLDefault } />

        {/* G+ Meta tags */}
        <meta itemprop="name" content={ MetaTitle } />
        <meta itemprop="description" content={ MetaDescription } />
        <meta itemprop="image" content={ MetaAppURLDefault + AuthnaOgImage } />

        {/* Twitter Meta Tags */}
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:url" content={ MetaAppURL } />
        <meta name="twitter:title" content={ MetaTitle } />
        <meta name="twitter:description" content={ MetaDescription } />
        <meta name="twitter:image" content={ MetaAppURLDefault + AuthnaOgImage } />
      </Helmet>

      <MainHeader hasTag={false} pageName="Authna" shortDescription="Plug and play user authentication system that we use at Drabkirn, and you can use it too." />

      <section className="container">
        <div>
          <p className="fs-1-6">Why re-create user's authentication in every app that you build? You can fire up an Authna server, configure your apps to use Authna, and get your users authenticated. Sweet and simple.</p>
        </div>
      </section>

      <section className="mt-50">
        <div className="align-center">
          <a href="https://github.com/drabkirn/authna" className="btn btn-wide" target="_blank" rel="noopener noreferrer">GitHub</a>
          <br />
          <Link to="/" className="btn btn-wide btn-rev">Back</Link>
        </div>
      </section>

      <Footer />
    </React.Fragment>
  );
}

export default Authna;
