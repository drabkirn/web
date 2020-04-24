require 'rails_helper'

feature "Newsletter - GET /newsletter", js: true do
  before(:each) do
    visit "/newsletter"
  end

  it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('h2', text: 'Newsletter')
    expect(page).to have_selector('p.fs-1-8', text: /We had to work a lot on making a free newsletter for you./)
  end

  scenario "main section content" do
    # Newsletter form elements
    expect(page).to have_selector('h2', text: 'Subscribe to our newsletter')
    expect(page).to have_selector('u.u-gold', text: /You've got nothing to worry about; you can read our/)
    expect(page).to have_link('privacy policy', href: '/legal/privacy_policy')
    expect(page).to have_selector('.form-field input[type="text"]')
    expect(page).to have_selector('.form-field input[type="email"]')
    expect(page).to have_selector('.btn', text: "Subscribe")

    # shows newsletter redirect form link if form is not working"
    expect(page).to have_selector('a.fs-1', text: "We understand things sometimes break, anyways click here if the above form doesn't work.")
    expect(page).to have_link("We understand things sometimes break, anyways click here if the above form doesn't work.", href: 'https://go.cdadityang.xyz/nlif')

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