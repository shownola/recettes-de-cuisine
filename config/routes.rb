Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  get 'pages/home', to: 'pages#home'

  resources :recipes do
    resources :comments, only: [:create]
    collection do
      get :search
    end
    member do
      post 'like'
    end
  end

  # resources :recipes do
  #   resources :comments, only: [:create]
  #   member do
  #     post 'like'
  #   end
  # end
  # 

  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  mount ActionCable.server => '/cable'
  get '/chat', to:'chatrooms#show'

  resources :messages, only: [:create]

  # get '/recipes', to: 'recipes#index'
  # get 'recipes/new', to: 'recipes#new', as: 'new_recipe'
  # get '/recipes/:id', to: 'recipes#show', as: 'recipe'


end
