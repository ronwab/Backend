# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests, :posts, :locations, :garden_fertilizers, :garden_activities,
            :harvests, :search

  # resources :gardens do
  #   resources :fertilizers
  # end

  resources :fertilizers do
    resources :gardens
  end
  resources :gardens do
    collection do
      get :gardens_all
    end
  end
  get '/fertilizers/:id/gardens', to: 'gardens#fertilized_gardens'
  get '/garden/:id/fertilizers', to: 'gardens#applied_fertilizers'
  get '/fertilizers_search', to: 'fertilizers#search_fertilizer'
  get 'fertilized_gardens', to: 'fertilizers#gardens_with_fertilizer'

  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
