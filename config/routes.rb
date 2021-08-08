Rails.application.routes.draw do
  devise_for :users
  root to: 'schedules#index'
  resources :schedules do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show do
    collection do
      get 'search'
    end
  end
  resources :post_pdf, only: :index
end
