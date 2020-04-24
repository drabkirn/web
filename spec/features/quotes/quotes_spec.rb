require 'rails_helper'

feature "Quotes - GET /quotes", js: true do
  before(:each) do
    3.times { create(:quote) }
    # Test for Twitter truncate text
    create(:quote, content: Faker::Lorem.sentence(word_count: 50))
    visit "/quotes"
  end

  it_behaves_like "Drabkirn Shared Header Content"

  scenario "header extra content" do
    expect(page).to have_selector('h2', text: 'Quotes')
    expect(page).to have_selector('p.fs-1-8', text: /We write thoughts in the form to redefine inspiration in a few words./)
  end

  scenario "main section content" do
    # Quotes Introduction
    expect(page).to have_selector('p', text: /We usually release a new quote once a week, but in case we are very imaginative, we may come up with a couple of them per week./)
    expect(page).to have_link('check out our docs', href: '/docs#quotes')
    expect(page).to have_selector('p', text: /Here are all the quotes straight from our database/)

    # Quotes cards
    drabkirnQuotesBaseURL = "https://drabkirn.cdadityang.xyz/quotes"
    allQuotes = Quote.all
    allQuotes.each do |quote|
      expect(page).to have_selector('.card .quotes-card-header h5', text: quote.title)
      expect(page).to have_selector('.card .quotes-card-content p', text: quote.content)

      twitterCharLimit = 220;
      twitterTruncatedText = "";
      if(quote.content.length > twitterCharLimit)
        twitterTruncatedText = quote.content[0...220] + "..."
      else
        twitterTruncatedText = quote.content
      end

      expect(page).to have_selector('.card .card-footer a[href="https://twitter.com/intent/tweet?text=' + twitterTruncatedText + '%0A&hashtags=drabkirn,quote&url=' + drabkirnQuotesBaseURL + '/' + quote.id.to_s + '&via=drabkirn"]')
      expect(page).to have_selector('.card .card-footer a[href="https://api.whatsapp.com/send?text=' + quote.content + '%0A%0A See more at ' + drabkirnQuotesBaseURL)
      expect(page).to have_selector('.card .card-footer a[href="https://www.facebook.com/sharer/sharer.php?u=' + drabkirnQuotesBaseURL + '/' + quote.id.to_s)
      expect(page).to have_selector('.card .card-footer a[href="https://www.linkedin.com/sharing/share-offsite/?url=' + drabkirnQuotesBaseURL + '/' + quote.id.to_s)
    end

    expect(page).to have_selector('.card .quotes-card-footer img[alt="twtr-share-icon"]', count: Quote.all.count)
    expect(page).to have_selector('.card .quotes-card-footer img[alt="wapp-share-icon"]', count: Quote.all.count)
    expect(page).to have_selector('.card .quotes-card-footer img[alt="fb-share-icon"]', count: Quote.all.count)
    expect(page).to have_selector('.card .quotes-card-footer img[alt="linkedin-share-icon"]', count: Quote.all.count)

    70.times { create(:quote) }
    visit "/quotes"
    expect(page).to have_selector('.pagination')
    expect(page).to have_selector('.pagination li', count: 8)

    
    # Navigation links/btns
    expect(page).to have_link('Back', href: '/')
  end

  scenario "Main section content with tag query string" do
    5.times { create(:quote, tags: ["abc", "def", "ghi", "jkl"]) }
    15.times { create(:quote) }
    7.times { create(:quote, tags: ["abc", "mno", "pqr", "stw"]) }

    visit "/quotes?tag=abc"

    expect(page).to have_selector('p', text: /Here are all the quotes with tag "abc" straight from our database/)
    expect(page).to have_selector('.card', count: 10)
    click_on '2'
    expect(page).to have_selector('.card', count: 2)
    expect(page).to have_selector('.pagination')
    expect(page).to have_selector('.pagination li', count: 2)

    # Navigation links/btns
    expect(page).to have_selector('.btn-wide', text: 'All Quotes')

    # Navigate when clicked
    click_on 'All Quotes'
    expect(page.current_path).to eq "/quotes"
  end

  # Navigate to respective pages on click - internal only
  scenario "navigates and shows home page" do
    click_on "Back"
    expect(page.current_path).to eq "/"
  end

  it_behaves_like "Drabkirn Shared Footer Content"
end