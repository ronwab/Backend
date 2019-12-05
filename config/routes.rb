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
  get '/fertilizer/:id/gardens', to: 'gardens#fertilized_gardens'
  get '/garden/:id/fertilizers', to: 'gardens#applied_fertilizers'
  # get '/gardens/all', to: 'gardens#all_garden'

  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
