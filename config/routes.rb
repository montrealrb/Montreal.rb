# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_for :users,
             controllers: {
               omniauth_callbacks: "users/omniauth_callbacks",
               registrations: "users/registrations"
             }

  # NOTE: temporary pages, remove when pages admin module is finished
  get "/about", to: "pages#about", as: :about
  get "/code-of-conduct", to: "pages#code_of_conduct", as: :code_of_conduct

  # privacy policy and terms of service - for Twitter authentication
  get "/terms", to: redirect("/terms.html")
  get "/privacy", to: redirect("/privacy.html")

  # NewsItem compatibility with old wordpress Posts url
  get "/:year/:month/:slug",
      to: "news_items#show",
      constraints: { year: /\d{4}/, month: /\d{2}/ }
  resources :news_items, only: %i(index show)

  resources :events, only: %i(index show)
  resources :organizations, only: %i(index show)
  resources :jobs, only: %i(index show)
  resources :pages, only: [:show]
  resource :member, only: %i(create edit update), path: :profile
  resources :talks, only: %i(new create show)

  root "home#index"
end
