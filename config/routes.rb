Rails.application.routes.draw do

  
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
    end
  end

  resources :genders
  resources :lengths
  resources :location_types
  resources :locations
  resources :messages, only: [:new, :create]

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