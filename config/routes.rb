Rails.application.routes.draw do

  resources :messages
  get 'welcome/about' => 'welcome#about'
  get 'welcome/faq' => 'welcome#faq'
  get 'welcome/users' => 'welcome#users'
  get 'welcome/trainers' => 'welcome#trainers'
  get 'welcome/terms' => 'welcome#terms' 
  get 'welcome/launch' => 'welcome#launch' 


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
  resources :charges
  resources :genders

  resources :profiles do 
    resources :reviews, except: [:show, :index]
    resources :messages, except: [:show, :index]
  end
  
  resources :appointments do
    resources :confirmations
  end


  
  devise_for :users, controllers: { registrations: "registrations" }

  get 'welcome/index'
 
  authenticated :user do
  	root 'profiles#index', as: "authenticated_root"
  end

  root  'welcome#index'

end