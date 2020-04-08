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
          <div className="show-on-large-device-only section-explain">
            <div className="col-dsk-4">
              <img src="/content/icons/if-mission-180x180.svg" alt="mission-image" className="mission-image" />
            </div>

            <div className="col-dsk-8">
              <p className="fs-1-6">
                Our mission is to connect and build a free, open, and privacy-respected open-source world that can improve humans life and beyond. We believe in our saying, <b><em>"Human's power is their power, and not the brand's power."</em></b>
              </p>  
            </div>
          </div>

          <div className="float-clearfix"></div>

          <div className="show-on-small-device-only">
            <div className="align-center">
              <img src="/content/icons/if-mission-180x180.svg" alt="mission-image" className="mission-image" />
            </div>

            <div className="mt-20">
              <p className="fs-1-4">
                Our mission is to connect and build a free, open, and privacy-respected open-source world that can improve humans life and beyond. We believe in our saying, <b><em>"Human's power is their power, and not the brand's power."</em></b>
              </p>  
            </div>
          </div>
        </div>

        <hr className="hr-center" />

        <div>
          <div className="show-on-large-device-only section-explain">
            <div className="col-dsk-4">
              <img src="/content/icons/if-vision-180x180.svg" alt="vision-image" className="vision-image" />
            </div>

            <div className="col-dsk-8">
              <p className="fs-1-6">
                Our vision is to empower every person on this planet (and beyond) to use free, open and privacy-respected solutions, and we intend to connect with them to spread happiness.
              </p>  
            </div>
          </div>

          <div className="float-clearfix"></div>

          <div className="show-on-small-device-only">
            <div className="align-center">
              <img src="/content/icons/if-vision-180x180.svg" alt="vision-image" className="vision-image" />
            </div>

            <div className="mt-20">
              <p className="fs-1-4">
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
          <a href="#" className="btn" target="_blank" rel="noopener noreferrer">Aditya</a>
          <a href="#" className="btn" target="_blank" rel="noopener noreferrer">Quotes</a>
          <a href="#" className="btn">Desityle</a>
          <a href="#" className="btn">Authna</a>
          <a href="#" className="btn">Docs</a>
        </div>
      </section>

      <section className="container">
        <div className="mt-90 mb-70">
          <p className="fs-1-6 mb-40">
            Don't forget to follow us on social media to stay ahead on us and also take some time to read our blog, because hey, you've got nothing to lose:
          </p>
          <div className="align-center drabkirn-social-icons">
            <a href="https://blog.cdadityang.xyz" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-blog-100x100.svg" alt="blog-icon" /></a>
            <a href="https://github.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-github-100x100.svg" alt="github-icon" /></a>
            <a href="https://twitter.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-twitter-100x100.svg" alt="twitter-icon" /></a>
            <a href="https://www.instagram.com/drabkirn" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/if-instagram-100x100.svg" alt="insta-icon" /></a>
            <a href="https://discordapp.com/invite/wFPtMUY" className="a-image mr-20" target="_blank" rel="noopener noreferrer"><img src="/content/icons/official-discord.svg" width="100px" height="100px" alt="discord-icon" /></a>
          </div>
        </div>
      </section>

      <Footer />
    </React.Fragment>
  );
}

export default Home;
