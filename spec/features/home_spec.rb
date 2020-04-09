require 'rails_helper'

feature "Drabkirn Homepage - GET /", js: true do
  before(:each) do
    visit "/"
  end

  it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('p.fs-1-8', text: '@drabkirn')
    expect(page).to have_selector('p', text: /Create the world out of the things that you build./)
  end

  scenario "main section content" do
    # Mission + vision images and statements
    expect(page).to have_selector('p.fs-1-6', text: /Our mission is to connect and build a free, open, and privacy-respected open-source world/)
    expect(page).to have_selector('img[src="/content/icons/if-mission-180x180.svg"]')
    expect(page).to have_selector('p.fs-1-6', text: /Our vision is to empower every person on this planet/)
    expect(page).to have_selector('img[src="/content/icons/if-vision-180x180.svg"]')

    # Navigation buttons + statement
    expect(page).to have_selector('p.fs-1-6', text: /We know our motto, mission, and vision are vague/)
    expect(page).to have_link('Aditya', href: '#')
    expect(page).to have_link('Quotes', href: '#')
    expect(page).to have_link('Desityle', href: '#')
    expect(page).to have_link('Authna', href: '#')
    expect(page).to have_link('Docs', href: '/docs')
  end

  scenario "social-connect section" do
    expect(page).to have_selector('p.fs-1-6', text: /Don't forget to follow us on social media to stay ahead on us/)

    expect(page).to have_link('', href: 'https://blog.cdadityang.xyz')
    expect(page).to have_link('', href: 'https://github.com/drabkirn')
    expect(page).to have_link('', href: 'https://twitter.com/drabkirn')
    expect(page).to have_link('', href: 'https://www.instagram.com/drabkirn')
    expect(page).to have_link('', href: 'https://discordapp.com/invite/wFPtMUY')
  end

  # Navigate to respective pages on click - internal only
  scenario "navigates and shows quotes page" do
    click_on "Quotes"
    expect(page.current_path).to eq "/"
  end

  scenario "navigates and shows desityle page" do
    click_on "Desityle"
    expect(page.current_path).to eq "/"
  end

  scenario "navigates and shows authna page" do
    click_on "Authna"
    expect(page.current_path).to eq "/"
  end

  scenario "navigates and shows docs page" do
    visit "/docs"
    expect(page.current_path).to eq "/docs"
  end

  it_behaves_like "Drabkirn Shared Footer Content"
end