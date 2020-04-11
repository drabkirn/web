class Ui::DocsController < ApplicationController
  def index
    @mainheader_app_name = "Docs"
    @mainheader_app_info = "Welcome to our docs. Whether you want to use our APIs, know the inner workings of our applications, or just anything, you've come to the right place. Let's learn and improve together."

    @body_content = $DOCS_BODY_CONTENT.html_safe
  end
end
