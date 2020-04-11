Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'ui/leaves#index'

  # When making API V1 requests only
  namespace :api, defaults: { format: :json }, path: '/', constraints: ApiRequestCheck.new do
    scope module: :v1 do
      post '/newsletter/subscribe', to: "newsletter#subscribe"
    end
  end

  # For Rails UI requests only
  get '/docs', to: "ui/docs#index"
  get '/legal/privacy_policy', to: "ui/legal#privacy_policy"
  get '/legal/terms_conditions', to: "ui/legal#terms_conditions"
  get '/legal/credits', to: "ui/legal#credits"
  get '/legal/cla', to: "ui/legal#cla"

  # When making invalid API-only requests, show 404 and 500
  match "/404", to: "application#action_not_found", via: [:all]
  match "/500", to: "application#internal_server_error", via: [:all]

  # For react UI requests
  match '*path', to: 'ui/leaves#index', via: :all, constraints: UiRequestCheck.new
end
