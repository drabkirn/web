import React from 'react';
import { Link } from "react-router-dom";

import MainHeader from '../Shared/MainHeader';
import Footer from '../Shared/Footer';

import GitHubIcon100x100 from 'images/icons/social/if-github-100x100.svg';
import TwitterIcon100x100 from 'images/icons/social/if-twitter-100x100.svg';
import InstaIcon100x100 from 'images/icons/social/if-instagram-100x100.svg';
import DiscordIcon100x100 from 'images/icons/social/official-discord.svg';

function Palace() {
  return (
    <React.Fragment>
      
      <MainHeader hasTag={false} pageName="Palace" shortDescription="All of the drabkirn in one place. Sweet and simple!" />

      <section className="container">
        <div>
          <p className="fs-1-4">
            We built this palace to gather all of the essential things of drabkirn on one page. Think this as an address book for everything drabkirn. For more generalized information about us, visit our <Link to="/">Home Page.</Link>
          </p>
        </div>
      </section>

      <hr className="hr-center" />

      <section className="container">
        <div>
          <h2 className="mb-5">Apps:</h2>
          <p className="italic fs-1">Here are some of the great things that we've built:</p>
          <div className="align-center mt-20">
            <Link to="/authna" className="btn">Authna</Link>
            <a href="/desityle/" className="btn btn-rev">Desityle</a>
            <Link to="/feedka" className="btn">Feedka</Link>
            <Link to="/quotes" className="btn btn-rev">Quotes</Link>
          </div>
        </div>
      </section>

      <hr className="hr-center" />

      <section className="container">
        <div>
          <h2 className="mb-5">Games:</h2>
          <p className="italic fs-1">Here are some of the great games that we've built:</p>
          <div className="align-center mt-20">
            <Link to="/games/rock_paper_scissors" className="btn btn-rev">RPS Game</Link>
          </div>
        </div>
      </section>

      <hr className="hr-center" />

      <section className="container">
        <div>
          <h2 className="mb-5">Writings:</h2>
          <p className="italic fs-1">We maintain a simple blog and documentation that reflects on how we make things work here at drabkirn.</p>
          <div className="align-center mt-20">
            <a href="https://blog.cdadityang.xyz" className="btn" target="_blank" rel="noopener noreferrer">Blog</a>
            <a href="/docs" className="btn">Docs</a>
            <Link to="/newsletter" className="btn rspec-a-newsletter">Newsletter</Link>
          </div>
        </div>
      </section>

      <hr className="hr-center" />

      <section className="container">
        <div>
          <h2 className="mb-5">Legal:</h2>
          <p className="italic fs-1">We don't take things seriously at drabkirn, unless it's legal:</p>
          <div className="align-center mt-20">
            <a href="/legal/privacy_policy" className="btn">Privacy</a>
            <a href="/legal/terms_conditions" className="btn">Terms</a>
            <a href="/legal/credits" className="btn">Credits</a>
            <a href="/legal/cla" className="btn">CLA</a>
          </div>
        </div>
      </section>

      <hr className="hr-center" />

      <section className="container">
        <div>
          <h2 className="mb-5">Social:</h2>
          <p className="italic fs-1">You may want to connect with us or collaborate or want to say us a sweet Hi, here's how you can do it:</p>
          <div className="drabkirn-social-icons align-center mt-30">
            <a href="https://twitter.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src={ TwitterIcon100x100 } alt="twitter-icon" /></a>
            <a href="https://www.instagram.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src={ InstaIcon100x100 } alt="insta-icon" /></a>
            <a href="https://github.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src={ GitHubIcon100x100 } alt="github-icon" /></a>
            <a href="https://discordapp.com/invite/wFPtMUY" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src={ DiscordIcon100x100 } width="100px" height="100px" alt="discord-icon" /></a>
          </div>
        </div>
      </section>

      <section className="container mt-50">
        <div className="align-center">
          <Link to={"/"} className="btn btn-wide">Back</Link>
        </div>
      </section>

      <Footer />
    </React.Fragment>
  );
}

export default Palace;
