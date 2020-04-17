import React from 'react';
import { Link } from 'react-router-dom';

function Footer() {
  return (
    <React.Fragment>
      <footer className="mt-80">
        <div className="row footer-legal">
          <div className="col-dsk-6 col-mob-12 pl-20">
            <p>Copyrights &copy;, 2019-2020 - <Link to="/">Drabkirn</Link></p>
          </div>
          <div className="footer-legal-links align-right col-dsk-6 col-mob-12 pr-20">
            <Link to="/newsletter" className="mr-10">Newsletter</Link>
            <Link to="/palace" className="mr-10">Palace</Link>
            <a href="mailto:drabkirn@cdadityang.xyz" className="mr-10">Contact</a>
          </div>
        </div>
        <div className="footer-baaaaaa">
          <p className="align-center"><i>@Baaaaaa</i></p>
        </div>
      </footer>
    </React.Fragment>
  );
}

export default Footer;
