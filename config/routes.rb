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

  get 'profile', to: 'pages#profile'

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

  resources :storylines, only: %i[new edit update destroy]
  resources :storylines, only: %i[index show] do
    resources :games, only: [:create]
    patch '/toggle-ready', to: 'storylines#toggle_ready'

    resources :places, only: %i[new update destroy]
    resources :places, only: :edit do
      resources :riddles, only: %i[new edit update destroy]
    end
  end

  post '/verify', to: 'riddles#verify'
  patch '/update', to: 'participations#update'


  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/406', to: 'errors#unacceptable', via: :all
end
