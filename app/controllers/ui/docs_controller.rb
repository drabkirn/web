class Ui::DocsController < ApplicationController
  def index
    @body_content = $DOCS_BODY_CONTENT.html_safe
  end
end
