import React from 'react';
import { Link } from "react-router-dom";

import MainHeader from '../Shared/MainHeader';
import Footer from '../Shared/Footer';

function Palace() {
  return (
    <React.Fragment>
      
      <MainHeader hasTag={false} pageName="Palace" shortDescription="All of the drabkirn in one place. Sweet and simple!" />

      <section className="container">
        <div className="mb-50">
          <p className="fs-1-4">
            We built this palace to gather all of the essential things of drabkirn on one page. Think this as an address book for everything drabkirn. For more generalized information about us, visit our <Link to="/">Home Page.</Link>
          </p>
        </div>

        <hr className="hr-center" />

        <div className="mb-50">
          <div>
            <h2>Apps:</h2>
            <p className="field-explanation">Here are some of the great things that we've built:</p>
            <div className="align-center mt-20">
              <a href="#" className="btn">Quotes</a>
              <a href="/desityle" className="btn">Desityle</a>
              <a href="#" className="btn">Authna</a>
            </div>
          </div>
        </div>

        <hr className="hr-center" />

        <div className="mb-50">
          <div>
            <h2>Writings:</h2>
            <p className="field-explanation">We maintain a simple blog and documentation that reflects on how we make things work here at drabkirn.</p>
            <div className="align-center mt-20">
              <a href="https://blog.cdadityang.xyz" className="btn" target="_blank" rel="noopener noreferrer">Blog</a>
              <a href="/docs" className="btn">Docs</a>
              <Link to="/newsletter" className="btn rspec-a-newsletter">Newsletter</Link>
            </div>
          </div>
        </div>

        <hr className="hr-center" />

        <div className="mb-50">
          <div>
            <h2>Legal:</h2>
            <p className="field-explanation">We don't take things seriously at drabkirn, unless it's legal:</p>
            <div className="align-center mt-20">
              <a href="/legal/privacy_policy" className="btn">Privacy</a>
              <a href="/legal/terms_conditions" className="btn">Terms</a>
              <a href="/legal/credits" className="btn">Credits</a>
              <a href="/legal/cla" className="btn">CLA</a>
            </div>
          </div>
        </div>

        <hr className="hr-center" />

        <div className="mb-50">
          <div>
            <h2>Social:</h2>
            <p className="field-explanation">You may want to connect with us or collaborate or want to say us a sweet Hi, here's how you can do it:</p>
            <div className="drabkirn-social-icons align-center mt-30">
              <a href="https://twitter.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-twitter-100x100.svg" alt="twitter-icon" /></a>
              <a href="https://www.instagram.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-instagram-100x100.svg" alt="insta-icon" /></a>
              <a href="https://github.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-github-100x100.svg" alt="github-icon" /></a>
              <a href="https://discordapp.com/invite/wFPtMUY" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/official-discord.svg" width="100px" height="100px" alt="discord-icon" /></a>
            </div>
          </div>
        </div>

        <hr className="hr-center" />

        <div className="mb-70">
          <div className="align-center">
            <Link to={"/"} className="btn wide-btn">Back</Link>
          </div>
        </div>
      </section>

      <Footer />
    </React.Fragment>
  );
}

export default Palace;
