require 'rails_helper'

feature "Quote of ID - GET /quotes/:id", js: true do
  before(:each) do
    (1..3).each do |i|
      create(:quote, id: i)
    end
    @selected_quote = Quote.first
    visit "/quotes/#{@selected_quote.id}"
  end

  it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('h2', text: 'Quotes')
    expect(page).to have_selector('p.fs-1-8', text: /We write thoughts in the form to redefine inspiration in a few words./)
  end

  scenario "main section content" do
    # Quotes Show content of the ID
    expect(page).to have_selector('h4', text: @selected_quote.title)
    expect(page).to have_selector('.blockquote-quotes-pink', text: @selected_quote.content)
    expect(page).to have_selector('p', text: "- #{@selected_quote.author.upcase}")
    expect(page).to have_selector('p', text: /PUBLISHED ON:/)
    @selected_quote.tags.each do |tag|
      expect(page).to have_selector('p', text: tag.upcase)
      expect(page).to have_link(tag, href: "/quotes?tag=#{tag}")
    end

    expect(page).to have_selector('h2', text: "Share em:")
    expect(page).to have_selector('p', text: /Hey, did you know, you can share our quotes directly from below, we save you from heavy-lifting COPY-PASTING them/)
    
    # Navigation links/btns
    expect(page).to have_link('Back', href: '/quotes')
  end

  scenario "Previous and Next Quotes Navigation links" do
    @selected_quote = Quote.find(2)
    visit "/quotes/#{@selected_quote.id}"
    expect(page).to have_selector('.btn', text: '==>')
    expect(page).to have_selector('.btn', text: '<==')
  end

  scenario "Navigate to Previous Quote" do
    @selected_quote = Quote.find(2)
    visit "/quotes/#{@selected_quote.id}"
    click_on '<=='
    sleep 1
    expect(page.current_path).to eq "/quotes/1"
  end

  scenario "Navigate to Next Quote" do
    @selected_quote = Quote.find(2)
    visit "/quotes/#{@selected_quote.id}"
    click_on '==>'
    sleep 1
    expect(page.current_path).to eq "/quotes/3"
  end

  # Navigate to respective pages on click - internal only
  scenario "Navigate to /quotes when button is clicked" do
    click_on 'Back'
    expect(page.current_path).to eq "/quotes"
  end

  it_behaves_like "Drabkirn Shared Footer Content"
end