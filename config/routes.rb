Rails.application.routes.draw do
  get 'organizations/index'

  get 'organizations/show'

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_for :users

  resources :events, :news_items, :organizations

  root 'home#index'
end
