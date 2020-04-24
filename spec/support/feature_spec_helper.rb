shared_examples 'Drabkirn Shared Header Content' do
  scenario "Drabkirn Shared Header Content" do
    expect(page).to have_selector('img[alt="Drabkirn Logo Header"]')
    expect(page).to have_selector('img[src="/content/images/drabkirn-logo-180x180.png"]')
    expect(page).to have_selector('h1', text: 'Drabkirn')

    find('img[alt="Drabkirn Logo Header"]').click
    expect(page.current_path).to eq "/"
  end
end

shared_examples 'Drabkirn Shared Footer Content' do
  scenario "Drabkirn Shared Footer Content" do
    expect(page).to have_selector('footer .row p', text: '2019-2020 - Drabkirn')
    expect(page).to have_link('Drabkirn', href: '/')
    expect(page).to have_selector('footer p', text: '@Baaaaaa')

    expect(page).to have_link('Newsletter', href: '/newsletter')
    expect(page).to have_link('Palace', href: '/palace')
    expect(page).to have_link('Contact', href: 'mailto:drabkirn@cdadityang.xyz')
  end

  # Navigate to respective pages on click - internal only
  scenario "navigates and shows newsletter page" do
    find("footer .align-right > a:nth-child(1)").click
    expect(page.current_path).to eq "/newsletter"
  end

  scenario "navigates and shows palace page" do
    click_on "Palace"
    expect(page.current_path).to eq "/palace"
  end
end