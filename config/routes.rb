Rails.application.routes.draw do

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # NewsItem compatibility with old wordpress Posts url
  get "/:year/:month/:slug",
    to: "news_items#show",
    constraints: { year: /\d{4}/, month: /\d{2}/ }
  resources :news_items, only: [:index, :show]

  resources :events, only: [:index, :show]
  resources :organizations, only: [:index, :show]
  resources :pages, only: [:show]

  root 'home#index'
end
