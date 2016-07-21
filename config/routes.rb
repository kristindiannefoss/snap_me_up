Rails.application.routes.draw do
  root to: 'pages#index'

  resources :users

  get '/auth/team_snap', as: 'sign_in'
  get '/auth/team_snap/callback', to: 'sessions#create'
  post "/auth/team_snap/callback", to: "sessions#create"

  delete '/logout', to: 'sessions#destroy', as: :logout

  get "/user/:id", to: "users#show", as: "dashboard"

end
