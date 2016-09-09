Rails.application.routes.draw do

  
  resources :posts
  get 'welcome/about' => 'welcome#about'
  get 'welcome/faq' => 'welcome#faq'
  get 'welcome/users' => 'welcome#users'
  get 'welcome/trainers' => 'welcome#trainers'
  get 'welcome/terms' => 'welcome#terms' 
  get 'welcome/launch' => 'welcome#launch' 

  resources :appointments do
    resources :confirmations
  end

  

  resources :certifications
  resources :charges

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :genders
  resources :lengths
  resources :location_types
  resources :locations
  resources :messages, only: [:new, :create]

  resources :posts do 
    resources :blogcomments
  end

  resources :profiles do 
    resources :reviews, except: [:show, :index]
  end

  resources :profile_certifications
  resources :profile_locations
  resources :profile_workout_types
  resources :profile_workouts
  resources :workouts
  resources :workouttypes

  
  devise_for :users, controllers: { registrations: "registrations" }

  get 'welcome/index'
 
  authenticated :user do
  	root 'profiles#index', as: "authenticated_root"
  end

  root  'welcome#index'

end