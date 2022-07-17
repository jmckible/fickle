Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: :login
  post 'authenticate', to: 'sessions#create', as: :authenticate
  get  'google', to: 'session#google', as: :google_login

  resources :polls, shallow: true do
    resources :ballots
    resources :caucuses
    resources :choices
  end

  root to: 'polls#index'
end
