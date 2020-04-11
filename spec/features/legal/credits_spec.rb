require 'rails_helper'

feature "Legal Credits - GET /legal/credits" do
  before(:each) do
    visit "/legal/credits"
  end

  it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('h2', text: 'Credits')
    expect(page).to have_selector('p.fs-1-8', text: /Since we believe in a free and open-world/)
  end

  scenario "main section content" do
    expect(page).to have_selector('p', text: /At Drabkirn, We use the following free services/)
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