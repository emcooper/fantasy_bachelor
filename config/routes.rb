Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show, :edit, :update, :destroy]
  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:index]
  end

  resources :weeks, only: [:show]

  resources :weekly_scores, only: [:create]
end
