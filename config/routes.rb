Rails.application.routes.draw do

  resources :lengths
  resources :location_types
  resources :profile_locations
  resources :locations
  resources :profile_workouts
  resources :workouts
  resources :profile_certifications
  resources :certifications
  resources :profile_workout_types
  resources :workouttypes
  resources :profiles do 
  resources :reviews, except: [:show, :index]
  end

  
  
  resources :appointments do
    resources :confirmations
  end

  resources :charges
  resources :genders
  
  devise_for :users, controllers: { registrations: "registrations" }

  get 'welcome/index'
 
  authenticated :user do
  	root 'appointments#index', as: "authenticated_root"
  end

  root  'welcome#index'

end