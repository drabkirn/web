class Ui::LegalController < ApplicationController
  def privacy_policy
    @mainheader_app_name = "Privacy Policy"
    @mainheader_app_info = "Our mission at drabkirn is reflected more in our privacy policy. We sincerely care about the privacy of your data and are committed to protecting it."

    @body_content = $LEGAL_PP_BODY_CONTENT.html_safe
  end

  def terms_conditions
    @mainheader_app_name = "Terms and Conditions"
    @mainheader_app_info = "There are some rules and regulations you need to read, understand, and agree to access our websites and our products."

    @body_content = $LEGAL_TNC_BODY_CONTENT.html_safe
  end

  def credits
    @mainheader_app_name = "Credits"
    @mainheader_app_info = "Since we believe in a free and open-world, we use some free stuff out there to make drabkirn work as you see it today."

    @body_content = $LEGAL_CREDITS_BODY_CONTENT.html_safe
  end

  def cla
    @mainheader_app_name = "Contributor License Agreement (CLA)"
    @mainheader_app_info = "This document applies to you when you choose to contribute to drabkirn, and this Agreement is to clarify and document the rights granted by contributors to drabkirn."

    @body_content = $LEGAL_CLA_BODY_CONTENT.html_safe
  end
end
