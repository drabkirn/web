import React from 'react';
import { Link } from "react-router-dom";

import MainHeader from '../Shared/MainHeader';
import Footer from '../Shared/Footer';

function Home() {
  return (
    <React.Fragment>
      
      <MainHeader hasTag={true} tagName="@drabkirn" shortDescription="Create the world out of the things that you build. We build those things and will set them free. We also write thoughts and much more." />

      <section className="container">
        <div>
          <div className="row align-center-flex-vh">
            <div className="col-dsk-4 col-mob-12 align-center-on-mob-only">
              <img src="/content/icons/if-mission-180x180.svg" alt="mission-image" className="light-grey-bg" />
            </div>

            <div className="col-dsk-8 col-mob-12 mt-15-on-mob-only">
              <p className="fs-1-6">
                Our mission is to connect and build a free, open, and privacy-respected open-source world that can improve humans life and beyond. We believe in our saying, <b><em>"Human's power is their power, and not the brand's power."</em></b>
              </p>
            </div>
          </div>
        </div>

        <hr className="hr-center" />

        <div>
          <div className="row align-center-flex-vh">
            <div className="col-dsk-4 col-mob-12 align-center-on-mob-only">
              <img src="/content/icons/if-vision-180x180.svg" alt="vision-image" className="light-grey-bg vision-image" />
            </div>

            <div className="col-dsk-8 col-mob-12 mt-15-on-mob-only">
              <p className="fs-1-6">
                Our vision is to empower every person on this planet (and beyond) to use free, open and privacy-respected solutions, and we intend to connect with them to spread happiness.
              </p>
            </div>
          </div>
        </div>

        <hr className="hr-center" />

        <div>
          <p className="fs-1-6">
            We know our motto, mission, and vision are vague, but hey, does that even matter? Let's dive in straight on what we've got for you:
          </p>
        </div>

        <div className="mt-30 align-center">
          <a href="https://cdadityang.xyz" className="btn" target="_blank" rel="noopener noreferrer">Aditya</a>
          <Link to="/authna" className="btn btn-rev">Authna</Link>
          <a href="/desityle" className="btn">Desityle</a>
          <a href="/docs" className="btn btn-rev">Docs</a>
          <a href="https://feedka.herokuapp.com" className="btn" target="_blank" rel="noopener noreferrer">Feedka</a>
          <Link to="/quotes" className="btn btn-rev">Quotes</Link>
        </div>
      </section>

      <section className="container mt-60">
        <div>
          <p className="fs-1-6">
            Don't forget to follow us on social media to stay ahead on us and also take some time to read our blog, because hey, you've got nothing to lose:
          </p>
        </div>

        <div className="align-center mt-30">
          <a href="https://blog.cdadityang.xyz" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-blog-100x100.svg" alt="blog-icon" /></a>
          <a href="https://github.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-github-100x100.svg" alt="github-icon" /></a>
          <a href="https://twitter.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-twitter-100x100.svg" alt="twitter-icon" /></a>
          <a href="https://www.instagram.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-instagram-100x100.svg" alt="insta-icon" /></a>
          <a href="https://discordapp.com/invite/wFPtMUY" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/official-discord.svg" width="100px" height="100px" alt="discord-icon" /></a>
        </div>
      </section>

      <Footer />
    </React.Fragment>
  );
}

export default Home;
