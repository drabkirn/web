import React from 'react';
import { Link } from 'react-router-dom';

function MainHeader(props) {
  return (
    <React.Fragment>
      <header>
        <div className="row align-center-flex-vh">
          <div className="col-dsk-4 col-mob-12 align-center mt-30">
            <Link to="/" className="a-image"><img src="/content/images/drabkirn-logo-180x180.png" alt="Drabkirn Logo Header" /></Link>
          </div>

          <div className="col-dsk-8 col-mob-12 align-center-on-mob-only">
            <h1>Drabkirn</h1>
            {
              props.hasTag ? (
                <p className="fs-1-8"><b><em>{ props.tagName }</em></b></p>
              ) : (
                <h2>{ props.pageName }</h2>
              )
            }
            <p className="mt-20 fs-1-8">{ props.shortDescription }</p>
          </div>
        </div>

        <hr />
      </header>
    </React.Fragment>
  );
}

export default MainHeader;
