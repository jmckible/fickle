Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: :login
  post 'authenticate', to: 'sessions#create', as: :authenticate

  resources :polls, shallow: true do
    resources :ballots
    resources :choices
  end

  root to: 'polls#index'
end
