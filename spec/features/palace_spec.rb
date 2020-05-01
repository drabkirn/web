require 'rails_helper'

feature "Palace - GET /palace", js: true do
  before(:each) do
    visit "/palace"
  end

  it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('h2', text: 'Palace')
    expect(page).to have_selector('p.fs-1-8', text: /All of the drabkirn in one place. Sweet and simple!/)
  end

  scenario "main section content" do
    expect(page).to have_selector('p.fs-1-4', text: "We built this palace to gather all of the essential things of drabkirn on one page. Think this as an address book for everything drabkirn.")

    # Apps section
    expect(page).to have_selector('h2', text: "Apps:")
    expect(page).to have_selector('p.italic.fs-1', text: "Here are some of the great things that we've built:")
    expect(page).to have_link('Authna', href: '/authna')
    expect(page).to have_link('Desityle', href: '/desityle')
    expect(page).to have_link('Feedka', href: 'https://feedka.herokuapp.com')
    expect(page).to have_link('Quotes', href: '/quotes')

    # Writings section
    expect(page).to have_selector('h2', text: "Writings:")
    expect(page).to have_selector('p.italic.fs-1', text: "We maintain a simple blog and documentation that reflects on how we make things work here at drabkirn.")
    expect(page).to have_link('Blog', href: 'https://blog.cdadityang.xyz')
    expect(page).to have_link('Docs', href: '/docs')
    expect(page).to have_selector('.rspec-a-newsletter', text: "Newsletter")

    # Legal section
    expect(page).to have_selector('h2', text: "Legal:")
    expect(page).to have_selector('p.italic.fs-1', text: "We don't take things seriously at drabkirn, unless it's legal:")
    expect(page).to have_link('Privacy', href: '/legal/privacy_policy')
    expect(page).to have_link('Terms', href: '/legal/terms_conditions')
    expect(page).to have_link('Credits', href: '/legal/credits')
    expect(page).to have_link('CLA', href: '/legal/cla')

    # social section
    expect(page).to have_selector('h2', text: "Social:")
    expect(page).to have_selector('p.italic.fs-1', text: "You may want to connect with us or collaborate or want to say us a sweet Hi, here's how you can do it:")
    expect(page).to have_link('', href: 'https://github.com/drabkirn')
    expect(page).to have_link('', href: 'https://twitter.com/drabkirn')
    expect(page).to have_link('', href: 'https://www.instagram.com/drabkirn')
    expect(page).to have_link('', href: 'https://discordapp.com/invite/wFPtMUY')

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