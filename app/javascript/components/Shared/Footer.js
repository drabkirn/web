import React from 'react';
import { Link } from 'react-router-dom';

function Footer() {
  return (
    <React.Fragment>
      <footer className="mt-60">
        <div className="row">
          <div className="col-dsk-6 col-mob-12 pl-20 mt-5 align-center-on-mob-only">
            <p>Copyrights &copy;, 2019-2020 - <Link to="/">Drabkirn</Link></p>
          </div>
          <div className="col-dsk-6 col-mob-12 pr-20 mt-5 align-right align-center-on-mob-only">
            <Link to="/newsletter" className="mr-10">Newsletter</Link>
            <Link to="/palace" className="mr-10">Palace</Link>
            <a href="mailto:drabkirn@cdadityang.xyz" className="mr-10">Contact</a>
          </div>
        </div>
        <div className="align-center mt-5">
          <p className="italic">@Baaaaaa</p>
        </div>
      </footer>
    </React.Fragment>
  );
}

export default Footer;
