Rails.application.routes.draw do

  root to: 'pages#index'

  # use_doorkeeper
  resources :users

  resources :sessions, only: [:new, :create]

  get 'auth/teamsnap', as: 'teamsnap_login'
  get '/auth/teamsnap/callback', to: 'sessions#create', as: 'teamsnap_callback'
  post '/auth/teamsnap/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: :logout


end
