Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'

  get '/hikers/leaderboard', to: 'hikers#leaderboard', as: 'hikers_leaderboard'

  resources :hikers, only: [:new, :create, :show] do
    resources :aspirations, only: [:index, :new, :create, :update]
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/google_oauth2/callback', to: 'sessions#create'


end
