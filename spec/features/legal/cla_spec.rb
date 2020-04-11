require 'rails_helper'

feature "Legal CLA - GET /legal/cla" do
  before(:each) do
    visit "/legal/cla"
  end

  it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('h2', text: 'Contributor License Agreement (CLA)')
    expect(page).to have_selector('p.fs-1-8', text: /This document applies to you when you choose to contribute to drabkirn/)
  end

  scenario "main section content" do
    expect(page).to have_selector('p', text: "Throughout this policy:")
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