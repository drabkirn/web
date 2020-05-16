import React from 'react';
import { Link } from "react-router-dom";
import { Helmet } from "react-helmet";

import MainHeader from '../Shared/MainHeader';
import Footer from '../Shared/Footer';

import FeedkaOgImage from 'images/og_images/feedka.png';
import GetStartedIllustration from 'images/illustrations/get_started.svg';
import AnonFeedbackIllustration from 'images/illustrations/anon_feedback.svg';
import ModerationIllustration from 'images/illustrations/moderation.svg';
import MakePublicIllustration from 'images/illustrations/make_public.svg';
import SecurityIllustration from 'images/illustrations/security.svg';
import SetFreeIllustration from 'images/illustrations/set_free.svg';

function Feedka() {
  const MetaTitle = "Feedka - Get constructive feedback | Drabkirn";
  const MetaDescription = "Get authentic, kindful, and constructive feedback from your friends, family, and co-workers. It's completely anonymous, safe and secure. Also, free and open-source.";
  const MetaKeywords = "drabkirn, drab, feedka, drabkirn feedka, drab feedka, feedback, constructive feedback, drabkirn feedback, honest feedback, anonymous feedback";
  const MetaAppURL = "https://drabkirn.cdadityang.xyz/feedka";
  const MetaSiteName = "Feedka";

  const MetaAppURLDefault = "https://drabkirn.cdadityang.xyz";

  return (
    <React.Fragment>
      <Helmet>
        <title>{ MetaTitle }</title>

        <meta name="description" content={ MetaDescription } />
        <meta name="keywords" content={ MetaKeywords } />

        {/* Facebook Meta */}
        <meta property="og:url" content={ MetaAppURL } />
        <meta property="og:image" content={ MetaAppURLDefault + FeedkaOgImage } />
        <meta property="og:description" content={ MetaDescription } />
        <meta property="og:title" content={ MetaTitle } />
        <meta property="og:site_name" content={ MetaSiteName } />
        <meta property="og:see_also" content={ MetaAppURLDefault } />

        {/* G+ Meta tags */}
        <meta itemprop="name" content={ MetaTitle } />
        <meta itemprop="description" content={ MetaDescription } />
        <meta itemprop="image" content={ MetaAppURLDefault + FeedkaOgImage } />

        {/* Twitter Meta Tags */}
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:url" content={ MetaAppURL } />
        <meta name="twitter:title" content={ MetaTitle } />
        <meta name="twitter:description" content={ MetaDescription } />
        <meta name="twitter:image" content={ MetaAppURLDefault + FeedkaOgImage } />
      </Helmet>

      <MainHeader hasTag={false} pageName="Feedka" shortDescription="Get authentic, kindful, and constructive feedback from your friends, family, and co-workers." />

      <section className="container mt-70" id="tour">
        <div className="row align-center-flex-vh">
          <div className="col-dsk-6 col-mob-12 mb-20">
            <img src={ GetStartedIllustration } alt="Get started illustration" className="image-responsive feedka-image-illustration" />
          </div>
          <div className="col-dsk-6 col-mob-12 mb-20">
            <h3 className="align-center">Get Set - Go</h3>
            <p>You start by simply creating an account, you then get a unique URL that you can share with others and boom you're now ready to get feedback from others.</p>
            <a href="https://feedka.herokuapp.com/users/sign_up" className="green-bg" target="_blank" rel="noopener noreferrer">Get Started Now</a>
          </div>
        </div>

        <hr className="hr-center" />

        <div className="row align-center-flex-vh">
          <div className="col-dsk-6 col-mob-12 mb-20 display-on-dsk-only">
            <h3 className="align-center">Anonymous</h3>
            <p>We don't collect any information from the person who sends you the feedback. On top of that, you'll receive your feedback anytime within 10 minutes to 5 hours after someone sends you the feedback. This helps to keep the identity of the person anonymous.</p>
          </div>
          <div className="col-dsk-6 col-mob-12 mb-20 display-on-dsk-only">
            <img src={ AnonFeedbackIllustration } alt="Anonymous illustration" className="image-responsive feedka-image-illustration" />
          </div>

          <div className="col-dsk-6 col-mob-12 mb-20 display-on-mob-only">
            <img src={ AnonFeedbackIllustration } alt="Anonymous illustration" className="image-responsive feedka-image-illustration" />
          </div>
          <div className="col-dsk-6 col-mob-12 mb-20 display-on-mob-only">
            <h3 className="align-center">Anonymous</h3>
            <p>We don't collect any information from the person who sends you the feedback. On top of that, you'll receive your feedback anytime within 10 minutes to 5 hours after someone sends you the feedback. This helps to keep the identity of the person anonymous.</p>
          </div>
        </div>

        <hr className="hr-center" />

        <div className="row align-center-flex-vh">
          <div className="col-dsk-6 col-mob-12 mb-20">
            <img src={ ModerationIllustration } alt="Moderation illustration" className="image-responsive feedka-image-illustration" />
          </div>
          <div className="col-dsk-6 col-mob-12 mb-20">
            <h3 className="align-center">Built in moderation</h3>
            <p>If someone tries to abuse you or tries to send Personal Identifiable Information(PII) through feedback, we won't let that feedback reach you. This helps keep our platform abuse-free, safe, and helps keep the identity of the person anonymous.</p>
          </div>
        </div>

        <hr className="hr-center" />

        <div className="row align-center-flex-vh">
          <div className="col-dsk-6 col-mob-12 mb-20 display-on-dsk-only">
            <h3 className="align-center">Make em public</h3>
            <p>If you love the feedback that you receive, you can make them public for others to see on your profile.</p>
          </div>
          <div className="col-dsk-6 col-mob-12 mb-20 display-on-dsk-only">
            <img src={ MakePublicIllustration } alt="Make public illustration" className="image-responsive feedka-image-illustration" />
          </div>

          <div className="col-dsk-6 col-mob-12 mb-20 display-on-mob-only">
            <img src={ MakePublicIllustration } alt="Make public illustration" className="image-responsive feedka-image-illustration" />
          </div>
          <div className="col-dsk-6 col-mob-12 mb-20 display-on-mob-only">
            <h3 className="align-center">Make em public</h3>
            <p>If you love the feedback that you receive, you can make them public for others to see on your profile.</p>
          </div>
        </div>

        <hr className="hr-center" />

        <div className="row align-center-flex-vh">
          <div className="col-dsk-6 col-mob-12 mb-20">
            <img src={ SecurityIllustration } alt="Security illustration" className="image-responsive feedka-image-illustration" />
          </div>
          <div className="col-dsk-6 col-mob-12 mb-20">
            <h3 className="align-center">Improved security</h3>
            <p>All the feedback that you receive is server-side encrypted and then saved to the database. You can also enable Two Factor Authentication(2FA) from <a href="https://feedka.herokuapp.com/users/edit" target="_blank" rel="noopener noreferrer">your settings</a> to add a layer of security to your account.</p>
          </div>
        </div>

        <hr className="hr-center" />

        <div className="row align-center-flex-vh">
          <div className="col-dsk-6 col-mob-12 mb-20 display-on-dsk-only">
            <h3 className="align-center">And set em free</h3>
            <p>We loved building feedka, so we set it free and even made it open-source whose codebase is available on <a href="https://github.com/drabkirn/feedka" target="_blank" rel="noopener noreferrer">GitHub</a>. So, no hidden data hogs, and we feel like a free bird.</p>
          </div>
          <div className="col-dsk-6 col-mob-12 mb-20 display-on-dsk-only">
            <img src={ SetFreeIllustration } alt="Running wild illustration" className="image-responsive feedka-image-illustration" />
          </div>

          <div className="col-dsk-6 col-mob-12 mb-20 display-on-mob-only">
            <img src={ SetFreeIllustration } alt="Running wild illustration" className="image-responsive feedka-image-illustration" />
          </div>
          <div className="col-dsk-6 col-mob-12 mb-20 display-on-mob-only">
            <h3 className="align-center">And set em free</h3>
            <p>We loved building feedka, so we set it free and even made it open-source whose codebase is available on <a href="https://github.com/drabkirn/feedka" target="_blank" rel="noopener noreferrer">GitHub</a>. So, no hidden data hogs, and we feel like a free bird.</p>
          </div>
        </div>
      </section>

      <hr  />

      <section className="mt-50">
        <div className="align-center">
          <h2 className="mb-40">Give it a try</h2>
          <a href="https://feedka.herokuapp.com" className="btn btn-wide" target="_blank" rel="noopener noreferrer">Demo</a>
          <br />
          <a href="https://github.com/drabkirn/feedka" className="btn btn-wide" target="_blank" rel="noopener noreferrer">GitHub</a>
          <br />
          <Link to="/" className="btn btn-wide btn-rev">Back</Link>
        </div>
      </section>

      <Footer />
    </React.Fragment>
  );
}

export default Feedka;
