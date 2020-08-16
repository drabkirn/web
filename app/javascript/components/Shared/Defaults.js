export const DRABKRIN_QUOTES_BASE_URL = "https://drabkirn.cdadityang.xyz/quotes";

let quotesApiKey;
if(process.env.NODE_ENV === "production") quotesApiKey = "059057113e7b666c9e64f48789d94617912766189f181a3c341e139da908";
else quotesApiKey = "0c20892fa04cfebe94c611baf13670a3e22284071ddf650933687a0a2522";

export const DRABKIRN_QUOTES_API_KEY = quotesApiKey;

export const DRABKIRN_EMAIL = "drabkirn@cdadityang.xyz";