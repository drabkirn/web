import React from 'react';
import { connect } from 'react-redux';
import { deviceDetect } from "react-device-detect";

import Footer from '../components/Shared/Footer';
import { reportFeError } from "../store/actions/feErrorActions";
import ErrorIllustration from "images/illustrations/error.svg";

class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      frontEndHasError: false,
      frontEndErrors: []
    };
  };

  setfrontEndError = (message) => {
    this.setState({
      frontEndErrors: [...this.state.frontEndErrors, message]
    });
  }

  static getDerivedStateFromError(error) {
    // Update state so the next render will show the fallback UI.
    return {
      frontEndHasError: true
    };
  }

  componentDidCatch(error, errorInfo) {
    // If error message is already there, do nothing
    const fullErrorMessage = `${ error.name }: ${ error.message }`
    if(this.state.frontEndErrors.includes(fullErrorMessage)) {
      return true;
    }

    // Append error message to frontEndErrors - no multiple API calls
    this.setfrontEndError(fullErrorMessage);

    // Make API Call
    const csrfToken = document.querySelector('[name="csrf-token"]').getAttribute('content');
    const errorStr = `
Type: React Error\n
Message: ${ fullErrorMessage }\n
URL: ${ document.location.href }\n
Device Details: ${ JSON.stringify(deviceDetect(), null, 2) }\n
Error Info: ${ JSON.stringify(errorInfo) }\n
    `;
    this.props.reportFeError(csrfToken, fullErrorMessage, errorStr);
  }

  componentDidMount() {
    window.addEventListener("error", (error) => {
      // If error message is already there, do nothing
      if(this.state.frontEndErrors.includes(error.message)) {
        return true;
      }

      // Append error message to frontEndErrors - no multiple API calls
      this.setfrontEndError(error.message);

      // Make API Call
      const csrfToken = document.querySelector('[name="csrf-token"]').getAttribute('content');
      const errorStr = `
Type: ${ error.type }\n
Message: ${ error.message }\n
URL: ${ document.location.href }\n
Device Details: ${ JSON.stringify(deviceDetect(), null, 2) }\n
ColumnNumber: ${ error.colno }\n
FileName: ${ error.filename }\n
LineNumber: ${ error.lineno }\n
Stack: ${ error.error.stack }\n
      `;
      this.props.reportFeError(csrfToken, error.message, errorStr);
      
      // Tell event listener, we've captured it
      return true;
    });
  }

  render() {
    const { feError } = this.props;

    if (this.state.frontEndHasError) {
      // You can render any custom fallback UI
      return(
        <div>
          <section className="container">
            <div className="align-center">
              <h2>Something went wrong</h2>

              {
                feError && feError.pushingError ? (
                  <div class="jumbo jumbo-error">
                    <p>{ feError.pushingError.message }</p>
                  </div>
                ) : ""
              }

              {
                feError && feError.data ? (
                  <div class="jumbo jumbo-success">
                    <p>{ feError.data.message }</p>
                  </div>
                ) : ""
              }

              <a className="btn mb-15" href="/">Go Back</a>
              
              <img src={ ErrorIllustration } alt="Error illustration" className="image-responsive feedka-image-illustration" />
            </div>
          </section>

          <Footer />
        </div>
      );
    }

    return this.props.children;
  }
}

const mapStateToProps = (state) => {
  return {
    feError: {
      data: state.feError.data,
      isFetching: state.feError.isFetching,
      pushingError: state.feError.pushingError
    }
  }
};

const mapDispatchToProps = (dispatch) => {
  return {
    reportFeError: (csrfToken, title, body) => dispatch(reportFeError(csrfToken, title, body))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(ErrorBoundary);