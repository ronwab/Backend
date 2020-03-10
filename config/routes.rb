# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests, :posts, :locations, :garden_fertilizers,
            :harvests, :search, :contacts

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

  # create custom route for search   route garden_activities/search
  # All other garden_activitiess routes should also work.
  resources :garden_activities do
   collection do
     get :search
   end
  end
  get '/fertilizers/:id/gardens', to: 'gardens#fertilized_gardens'
  get '/gardens_search', to: 'gardens#search_gardens'
  get '/garden/:id/fertilizers', to: 'gardens#applied_fertilizers'
  get '/fertilizers_search', to: 'fertilizers#search_fertilizer'
  get '/fertilized_gardens', to: 'fertilizers#gardens_with_fertilizer'
  get  '/gardens_test' , to: 'gardens#my_data'



                        root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
