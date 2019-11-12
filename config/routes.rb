# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests, :posts, :locations, :garden_fertilizers, :garden_activities

  resources :gardens do
    resources :fertilizers
  end

  resources :fertilizers do
    resources :gardens
  end
  get '/fertilizer/:id/gardens', to: 'gardens#fertilized_gardens'
  get '/garden/:id/fertilizers', to: 'gardens#applied_fertilizers'

  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
