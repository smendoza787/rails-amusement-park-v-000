Rails.application.routes.draw do
  resources :attractions

  get 'signin' => 'sessions#new'
  post 'sessions/create'
  delete 'sessions/destroy'

  post 'rides/create'

  devise_for :users
  resources :users
  root 'pages#index'
end
