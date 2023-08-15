require 'rails_helper'

feature "Authna - GET /authna", js: true do
  before(:each) do
    visit "/authna"
  end

  # it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('h2', text: 'Authna')
    # expect(page).to have_selector('p.fs-1-8', text: /Plug and play user authentication system that we use at Drabkirn, and you can use it too./)
  end

  # scenario "main section content" do
  #   # Authna Introduction
  #   expect(page).to have_selector('p', text: "Why re-create user's authentication in every app that you build? You can fire up an Authna server, configure your apps to use Authna, and get your users authenticated. Sweet and simple.")
    
  #   # Navigation links/btns
  #   expect(page).to have_link('GitHub', href: 'https://github.com/drabkirn/authna')
  #   expect(page).to have_link('Back', href: '/')
  # end

  # # Navigate to respective pages on click - internal only
  # scenario "navigates and shows home page" do
  #   click_on "Back"
  #   expect(page.current_path).to eq "/"
  # end

  # it_behaves_like "Drabkirn Shared Footer Content"
end