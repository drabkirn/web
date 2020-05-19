import React, { useRef, useState } from 'react';
import { Link } from "react-router-dom";
import { Helmet } from "react-helmet";

import MainHeader from '../Shared/MainHeader';
import Footer from '../Shared/Footer';

import RPSOgImage from 'images/og_images/grps.png';
import TwitterIcon100x100 from 'images/icons/social/if-twitter-100x100.svg';
import WhatsAppIcon100x100 from 'images/icons/social/if-whatsapp-100x100.svg';
import FacebookIcon100x100 from 'images/icons/social/if-facebook-100x100.svg';
import LinkedInIcon100x100 from 'images/icons/social/if-linkedin-100x100.svg';

function RPS() {
  // Referencing DOM elements for changing styles for later
  const nameAskDiv = useRef(null);
  const nameShowDiv = useRef(null);
  const statusJumboDiv = useRef(null);
  const gamePlayDiv = useRef(null);
  const pointsTablediv = useRef(null);
  const resetBtnDiv = useRef(null);
  const shareResultsDiv = useRef(null);
  
  // Local states
  const [name, setName] = useState("");
  const [statusMessage, setStatusMessage] = useState("Let's get started, select your choice:");
  const [userPoints, setUserPoints] = useState(0);
  const [computerPoints, setcomputerPoints] = useState(0);
  const [finalUserPoints, setFinalUserPoints] = useState(null);
  const [finalComputerPoints, setFinalComputerPoints] = useState(null);
  const [whatsAppShareURL, setWhatsAppShareURL] = useState("");
  const [twitterShareURL, setTwitterShareURL] = useState("");

  // Sharing the results
  const RPSGameURL = "https://drabkirn.cdadityang.xyz/games/rock_paper_scissors";
  const userWinMessage = (uPoints, cPoints) => {
    return `I've just defeated DrabkirnBot with ${uPoints}-${cPoints} while playing the Rock-Paper-Scissors game. It was a tough game, but I won it anyway. Can you win this challenge?`;
  };
  const userLostMessage = (uPoints, cPoints) => {
    return `It's sad to say, I've just lost with ${uPoints}-${cPoints} while playing the Rock-Paper-Scissors game with DrabkirnBot. Can you win this challenge?`;
  };
  const facebookShareURL = `https://www.facebook.com/sharer/sharer.php?u=${ RPSGameURL }`;
  const linkedinShareURL = `https://www.linkedin.com/sharing/share-offsite/?url=${ RPSGameURL }`;

  // If someone wins, execute this
  if(userPoints === 5 || computerPoints === 5) {
    resetBtnDiv.current.style.display = "block";
    gamePlayDiv.current.style.display = "none";
    shareResultsDiv.current.style.display = "block";

    if(userPoints === 5) {
      setStatusMessage("Yayay! How did you do that? NVM, you won anyway. Don't forget to share your results. Great day ahead!");
      statusJumboDiv.current.className = "jumbo jumbo-success mx-25";

      setFinalUserPoints(userPoints);
      setFinalComputerPoints(computerPoints);
      setUserPoints(0);
      setcomputerPoints(0);

      setWhatsAppShareURL(`https://api.whatsapp.com/send?text=${ userWinMessage(userPoints, computerPoints) } Head over to ${RPSGameURL}`);
      setTwitterShareURL(`https://twitter.com/intent/tweet?text=${ userWinMessage(userPoints, computerPoints) }%0A&hashtags=drabkirn,rpsgame&url=${ RPSGameURL }&via=drabkirn`);
    }

    if(computerPoints === 5) {
      setStatusMessage("Haha, Like I said, it's not that easy to defeat me. Better luck next time. Don't forget to share your results even if you've lost, I'm always available for a challenge.");
      statusJumboDiv.current.className = "jumbo jumbo-error mx-25";

      setFinalUserPoints(userPoints);
      setFinalComputerPoints(computerPoints);
      setUserPoints(0);
      setcomputerPoints(0);

      setWhatsAppShareURL(`https://api.whatsapp.com/send?text=${ userLostMessage(userPoints, computerPoints) } Head over to ${RPSGameURL}`);
      setTwitterShareURL(`https://twitter.com/intent/tweet?text=${ userLostMessage(userPoints, computerPoints) }%0A&hashtags=drabkirn,rpsgame&url=${ RPSGameURL }&via=drabkirn`);
    }
  }

  // Meta tags
  const MetaTitle = "Rock-Paper-Scissors Game | Drabkirn";
  const MetaDescription = "Here you go, It's now time for DrabkirnBot to defeat you in the Rock-Paper-Scissors game. The reel challenge begins now.";
  const MetaKeywords = "drabkirn, drab, rps, rock paper scissors, drabkirn rps, drabkirn games, drabkirn rock paper scissors game";
  const MetaAppURL = "https://drabkirn.cdadityang.xyz/games/rock_paper_scissors";
  const MetaSiteName = "RPS Game";

  const MetaAppURLDefault = "https://drabkirn.cdadityang.xyz";

  return (
    <React.Fragment>
      <Helmet>
        <title>{ MetaTitle }</title>

        <meta name="description" content={ MetaDescription } />
        <meta name="keywords" content={ MetaKeywords } />

        {/* Facebook Meta */}
        <meta property="og:url" content={ MetaAppURL } />
        <meta property="og:image" content={ MetaAppURLDefault + RPSOgImage } />
        <meta property="og:description" content={ MetaDescription } />
        <meta property="og:title" content={ MetaTitle } />
        <meta property="og:site_name" content={ MetaSiteName } />
        <meta property="og:see_also" content={ MetaAppURLDefault } />

        {/* G+ Meta tags */}
        <meta itemprop="name" content={ MetaTitle } />
        <meta itemprop="description" content={ MetaDescription } />
        <meta itemprop="image" content={ MetaAppURLDefault + RPSOgImage } />

        {/* Twitter Meta Tags */}
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:url" content={ MetaAppURL } />
        <meta name="twitter:title" content={ MetaTitle } />
        <meta name="twitter:description" content={ MetaDescription } />
        <meta name="twitter:image" content={ MetaAppURLDefault + RPSOgImage } />
      </Helmet>
      
      <MainHeader hasTag={false} pageName="RPS Game" shortDescription="Here you go, It's now time for DrabkirnBot to defeat you in the Rock-Paper-Scissors game!" />

      <section className="container mt-40 mb-80">
        <div style={{ maxWidth: "480px", margin: "0 auto" }}>
          <div className="nameAskDiv" ref={ nameAskDiv }>
            <div>
              <p className="fs-1-1">If you're new to this game, check out <a href="https://www.wikihow.com/Play-Rock,-Paper,-Scissors" target="_blank" rel="noopener noreferrer">this guide</a> on how to play. Get started by entering your name.</p>
            </div>

            <form className="form-tag" onSubmit={ (e) => {
              e.preventDefault();
              nameAskDiv.current.style.display = "none";
              nameShowDiv.current.style.display = "block";
              statusJumboDiv.current.style.display = "block";
              gamePlayDiv.current.style.display = "block";
              pointsTablediv.current.style.display = "block";
            } }>
              <div className="form-field">
                <label htmlFor="name" className="form-field-label">Name: </label>
                <p className="form-field-explanation">Don't worry, we don't collect your name, we just need it to refer to you while playing the game. Your name must have a minimum of 3 characters and a maximum of 15 characters.</p>
                <input type="text" className="form-field-input" id="name" required minLength="3" maxLength="15" onChange={ (e) => setName(e.target.value) } />
              </div>
              <div className="form-footer align-center">
                <button className="btn wide-btn submit-btn">Start</button>
              </div>
            </form>
          </div>

          <div className="nameShowDiv mx-25" ref={ nameShowDiv } style={ { display: "none"} }>
            <p className="fs-1-2">Holla, { name }, the reel challenge begins now. Remember, it's a 5-points game.</p>
          </div>

          <div className="jumbo jumbo-info light-white-text mx-25" style={{ display: "none" }} ref={ statusJumboDiv } >
            <p>{ statusMessage }</p>
          </div>
        </div>

        <div className="gamePlayDiv align-center mx-25" style={{ display: "none" }} ref={ gamePlayDiv }>
          <button className="btn" style={{ width: "auto" }} onClick={ () => {
            let computerNumber = Math.floor(Math.random() * 3);
            if(computerNumber == 0) {
              setStatusMessage(`It's a draw, DrabkirnBot also got "Rock".`);
              statusJumboDiv.current.className = "jumbo jumbo-warn mx-25";
            }
            else if(computerNumber == 1) {
              setStatusMessage(`Lol, you lose. DrabkirnBot got "Paper".`);
              setcomputerPoints(computerPoints + 1);
              statusJumboDiv.current.className = "jumbo jumbo-error mx-25";
            }
            else {
              setStatusMessage(`Hmmm, You win. DrabkirnBot got "Scissors".`);
              setUserPoints(userPoints + 1);
              statusJumboDiv.current.className = "jumbo jumbo-success mx-25";
            }
          } }>
            Rock
          </button>
          <button className="btn btn-rev" style={{ width: "auto" }} onClick={ () => {
            let computerNumber = Math.floor(Math.random() * 3);
            if(computerNumber == 0) {
              setStatusMessage(`Hmmm, You win. DrabkirnBot got "Rock".`);
              setUserPoints(userPoints + 1);
              statusJumboDiv.current.className = "jumbo jumbo-success mx-25";
            }
            else if(computerNumber == 1) {
              setStatusMessage(`It's a draw, DrabkirnBot also got "Paper".`);
              statusJumboDiv.current.className = "jumbo jumbo-warn mx-25";
            }
            else {
              setStatusMessage(`Lol, you lose. DrabkirnBot got "Scissors".`);
              setcomputerPoints(computerPoints + 1);
              statusJumboDiv.current.className = "jumbo jumbo-error mx-25";
            }
          } }>
            Paper
          </button>
          <button className="btn" style={{ width: "auto" }} onClick={ () => {
            let computerNumber = Math.floor(Math.random() * 3);
            if(computerNumber == 0) {
              setStatusMessage(`Lol, you lose. DrabkirnBot got "Rock".`);
              setcomputerPoints(computerPoints + 1);
              statusJumboDiv.current.className = "jumbo jumbo-error mx-25";
            }
            else if(computerNumber == 1) {
              setStatusMessage(`Hmmm, You win. DrabkirnBot got "Paper".`);
              setUserPoints(userPoints + 1);
              statusJumboDiv.current.className = "jumbo jumbo-success mx-25";
            }
            else {
              setStatusMessage(`It's a draw, DrabkirnBot also got "Scissors".`);
              statusJumboDiv.current.className = "jumbo jumbo-warn mx-25";
            }
          } }>
            Scissors
          </button>
        </div>

        <div className="pointsTablediv mt-30" style={{ display: "none", maxWidth: "480px", margin: "0 auto" }} ref={ pointsTablediv }>
          <p className="mb-5"><strong>Points Table:</strong></p>
          <table>
            <tbody>
              <tr>
                <td>{ name }</td>
                <td>{ finalUserPoints ? finalUserPoints : userPoints }</td>
              </tr>
              <tr>
                <td>Drabkirn Bot:</td>
                <td>{ finalComputerPoints ? finalComputerPoints : computerPoints }</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div className="shareResultsDiv align-center mb-10 mt-35" style={{ display: "none" }} ref={ shareResultsDiv }>
          <div>
            <h4>Share your results:</h4>
          </div>

          <div className="mt-25">
            <a className="a-image ml-15" href={ whatsAppShareURL } target="_blank" rel="noopener noreferrer"><img src={ WhatsAppIcon100x100 } alt="wapp-share-icon" style={{ width: "70px", height: "70px" }} /></a>
            <a className="a-image ml-15" href={ twitterShareURL } target="_blank" rel="noopener noreferrer"><img src={ TwitterIcon100x100 } alt="twtr-share-icon" style={{ width: "70px", height: "70px" }} /></a>
            <a className="a-image ml-15" href={ facebookShareURL } target="_blank" rel="noopener noreferrer"><img src={ FacebookIcon100x100 } alt="fb-share-icon" style={{ width: "70px", height: "70px" }} /></a>
            <a className="a-image ml-15" href={ linkedinShareURL } target="_blank" rel="noopener noreferrer"><img src={ LinkedInIcon100x100 } alt="linkedin-share-icon" style={{ width: "70px", height: "70px" }} /></a>
          </div>
        </div>

        <div className="resetBtnDiv align-center mt-10" style={{ display: "none" }} ref={ resetBtnDiv }>
          <p>or</p>
          <button className="btn mt-20" onClick={ () => {
            resetBtnDiv.current.style.display = "none";
            shareResultsDiv.current.style.display = "none";
            gamePlayDiv.current.style.display = "block";
            setFinalComputerPoints(null);
            setFinalUserPoints(null);
            setStatusMessage("Get started, select your choice:")
            statusJumboDiv.current.className = "jumbo jumbo-info light-white-text mx-25";
          } }>
            Reset
          </button>
        </div>
      </section>
      
      <hr className="hr-center" />

      <section className="container mt-50">
        <div className="align-center">
          <Link to={"/"} className="btn btn-wide">Back</Link>
        </div>
      </section>

      <Footer />
    </React.Fragment>
  );
}

export default RPS;
