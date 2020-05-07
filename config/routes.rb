Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'ui/leaves#index'

  # When making API V1 requests only
  namespace :api, defaults: { format: :json }, path: '/', constraints: ApiRequestCheck.new do
    scope module: :v1 do
      resources :quotes, only: [:index, :show]
      
      post '/newsletter/subscribe', to: "newsletter#subscribe"
    end
  end

  # Devise users, use custom for some controllers
  devise_for :users, controllers: { sessions: 'ui/users/sessions', registrations: 'ui/users/registrations', omniauth_callbacks: 'ui/users/omniauth_callbacks' }

  # Empty [] because unrequired `users` routes are not created
  ## Add 2FA endpoints
  resources :users, only: [] do
    member do
      post :enable_multi_factor_authentication, to: 'ui/users/multi_factor_authentication#verify_enable'
      post :disable_multi_factor_authentication, to: 'ui/users/multi_factor_authentication#verify_disable'
    end
  end

  # For Rails UI requests only
  get '/docs', to: "ui/docs#index"
  get '/legal/privacy_policy', to: "ui/legal#privacy_policy"
  get '/legal/terms_conditions', to: "ui/legal#terms_conditions"
  get '/legal/credits', to: "ui/legal#credits"
  get '/legal/cla', to: "ui/legal#cla"
  get '/legal/privacy/analytics_opt_out', to: "ui/legal#analytics_opt_out"
  get '/dashboard', to: "ui/leaves#dashboard", as: "dashboard"

  # When making invalid API-only requests, show 404 and 500
  match "/404", to: "application#action_not_found", via: [:all]
  match "/500", to: "application#internal_server_error", via: [:all]

  # For react UI requests
  match '*path', to: 'ui/leaves#index', via: :all, constraints: UiRequestCheck.new
end
