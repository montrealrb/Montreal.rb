Rails.application.routes.draw do
  get 'organizations/index'

  get 'organizations/show'

  resources :pages, except: [:index]

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_for :users

  resources :events, only: [:index, :show]
  resources :news_items, :organizations

  root 'home#index'
end

