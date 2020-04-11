require 'rails_helper'

feature "Docs - GET /docs" do
  before(:each) do
    visit "/docs"
  end

  it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('h2', text: 'Docs')
    expect(page).to have_selector('p.fs-1-8', text: /Welcome to our docs. Whether you want to use our APIs, know the inner workings of our applications/)
  end

  scenario "main section content" do
    # Has Table of contents
    expect(page).to have_selector('h2', text: "Table of contents")

    # Has introduction
    expect(page).to have_selector('li.ol-toc-item', text: "Introduction")
    expect(page).to have_selector('ol.ol-toc-nested li', text: "About Us", visible: false)
    expect(page).to have_selector('li[data-href="#about-us"]', text: "About Us", visible: false)

    # Has Desityle
    expect(page).to have_selector('li.ol-toc-item', text: "Desityle")
    expect(page).to have_selector('ol.ol-toc-nested li', text: "Usage", visible: false)
    expect(page).to have_selector('li[data-href="#desityle-usage"]', text: "Usage", visible: false)
    expect(page).to have_selector('ol.ol-toc-nested li', text: "Development Installation", visible: false)
    expect(page).to have_selector('li[data-href="#desityle-di"]', text: "Development Installation", visible: false)

    
    ## This at last
    # Navigation links/btns
    expect(page).to have_link('Back', href: '/')
  end

  # Navigate to respective pages on click - internal only
  scenario "navigates and shows home page" do
    click_on "Back"
    expect(page.current_path).to eq "/"
  end

  it_behaves_like "Drabkirn Shared Footer Content"
end