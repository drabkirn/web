# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://drabkirn.cdadityang.xyz"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add root_path, priority: 1
  add '/newsletter', priority: 0.8
  add '/palace', priority: 0.8
  add '/authna', priority: 0.8
  add '/docs', priority: 0.8
  add '/feedka', priority: 0.8

  ## Quotes endpoints
  add '/quotes', priority: 0.8
  Quote.find_each do |quote|
    add "/quotes/#{quote.id}", lastmod: quote.updated_at, priority: 0.8
  end

  ## Accounts endpoints
  add new_user_session_path
  add new_user_password_path
  add new_user_registration_path
  add new_user_confirmation_path
  add new_user_unlock_path

  ## Legal
  add legal_privacy_policy_path, priority: 0.7
  add legal_terms_conditions_path, priority: 0.7
  add legal_credits_path, priority: 0.7
  add legal_cla_path, priority: 0.7
  add legal_privacy_analytics_opt_out_path, priority: 0.7

  ## Desityle
  add '/desityle/', priority: 0.8
  add '/desityle/components', priority: 0.8
end
