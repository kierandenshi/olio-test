# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  resources :articles, only: [:index]
  get '/articles/:id', to: 'articles#like', as: 'article'
end
