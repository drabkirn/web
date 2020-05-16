module ApplicationHelper

  ## Which omniauth providers do we use?
  ## This is to hide certain activities for users
  def omniauth_providers_array
    ["github", "google_oauth2", "twitter"]
  end

  ## We don't want to show navigation bar everywhere
  ## Whitelist here where only to show
  def show_navigation_array
    ["ui/leaves/dashboard", "devise/confirmations/new", "devise/passwords/new", "devise/passwords/edit", "ui/users/sessions/new", "ui/users/registrations/new", "ui/users/registrations/edit", "devise/unlocks/new"]
  end
end
