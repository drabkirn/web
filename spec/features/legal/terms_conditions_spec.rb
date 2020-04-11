require 'rails_helper'

feature "Legal Terms and Conditions - GET /legal/terms_conditions" do
  before(:each) do
    visit "/legal/terms_conditions"
  end

  it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('h2', text: 'Terms and Conditions')
    expect(page).to have_selector('p.fs-1-8', text: /There are some rules and regulations you need to read, understand, and agree to access our websites and our products./)
  end

  scenario "main section content" do
    expect(page).to have_selector('p', text: "Throughout this document:")
  end

  scenario "shows navigation links in form of buttons" do
    expect(page).to have_link('Back', href: '/')
  end

  it_behaves_like "Drabkirn Shared Footer Content"
end