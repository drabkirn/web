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
    expect(page).to have_selector('p.fs-1-6', text: /Our vision is to empower every person on this planet/)

    # Navigation buttons + statement
    expect(page).to have_selector('p.fs-1-6', text: /We know our motto, mission, and vision are vague/)
    expect(page).to have_link('Aditya', href: 'https://cdadityang.xyz')
    expect(page).to have_link('Authna', href: '/authna')
    expect(page).to have_link('Dashboard', href: '/dashboard')
    expect(page).to have_link('Desityle', href: '/desityle/index.html')
    expect(page).to have_link('Docs', href: '/docs')
    expect(page).to have_link('Feedka', href: '/feedka')
    expect(page).to have_link('Quotes', href: '/quotes')
    expect(page).to have_link('Notga', href: '/notga/index.html')
    expect(page).to have_link('RPS Game', href: '/games/rock_paper_scissors')
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
  scenario "navigates and shows authna page" do
    click_on "Authna"
    expect(page.current_path).to eq "/authna"
  end

  scenario "navigates and shows dashboard page" do
    @user1 = create(:confirmed_user)
    login_as(@user1, scope: :user)
    click_on "Dashboard"
    expect(page.current_path).to eq "/dashboard"
  end

  scenario "navigates and shows sign in page when click on dashboard" do
    click_on "Dashboard"
    expect(page.current_path).to eq "/users/sign_in"
  end

  scenario "navigates and shows desityle page" do
    click_on "Desityle"
    expect(page.current_path).to eq "/desityle/index.html"
  end

  scenario "navigates and shows docs page" do
    visit "/docs"
    expect(page.current_path).to eq "/docs"
  end

  scenario "navigates and shows feedka page" do
    click_on "Feedka"
    expect(page.current_path).to eq "/feedka"
  end

  scenario "navigates and shows notga page" do
    click_on "Notga"
    expect(page.current_path).to eq "/notga/index.html"
  end

  scenario "navigates and shows quotes page" do
    click_on "Quotes"
    expect(page.current_path).to eq "/quotes"
  end

  scenario "navigates and shows RPS Game page" do
    click_on "RPS Game"
    expect(page.current_path).to eq "/games/rock_paper_scissors"
  end

  it_behaves_like "Drabkirn Shared Footer Content"
end