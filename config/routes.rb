Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get 'games/join', to: "games#join", as: "join_game"
  post 'games/access', to: "games#access", as: "access_game"

  resources :games, only: [:show] do
    member do
      patch '/start', to: "games#start"
      get '/lobby', to: "games#lobby"
      get '/end', to: "games#end_game"
    end
  end

  resources :games, only: [] do
    member do
      get 'results', to: "games#stats"
    end
  end

  resources :storylines, only: [:index, :show] do
    resources :games, only: [:create]
  end

  post '/verify', to: 'riddles#verify'
  patch '/update', to: 'participations#update'
end
