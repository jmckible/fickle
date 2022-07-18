Rails.application.routes.draw do
  get  'login',        to: 'sessions#new',    as: :login
  post 'authenticate', to: 'sessions#create', as: :authenticate
  get  'login/google', to: 'sessions#google', as: :google_login
  get  'logout',       to: 'sessions#logout', as: :logout

  resources :polls, shallow: true do
    resources :ballots
    resources :caucuses
    resources :choices
  end

  root to: 'polls#index'
end
