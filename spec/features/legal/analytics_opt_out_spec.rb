require 'rails_helper'

feature "Legal Analytics Opt Out - GET /legal/privacy/analytics_opt_out" do
  before(:each) do
    visit "/legal/privacy/analytics_opt_out"
  end

  it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('h2', text: 'Analytics Opt Out')
    expect(page).to have_selector('p.fs-1-8', text: /Like we said, we care about the privacy of your data and are committed to protecting it./)
  end

  scenario "main section content" do
    expect(page).to have_selector('iframe')
  end

  scenario "shows navigation links in form of buttons" do
    expect(page).to have_link('Back', href: '/legal/privacy_policy')
  end

  it_behaves_like "Drabkirn Shared Footer Content"
end