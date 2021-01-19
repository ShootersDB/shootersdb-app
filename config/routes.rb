Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :dashboard, only: [:index]
  resources :cartridges, only: [:index, :show]
  resources :reloading_checklists, only: [:index, :show] do
    get :label, on: :member
  end
end
