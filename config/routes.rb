Rails.application.routes.draw do
  namespace :admins do
    resources :users, except: :new
    resources :courses
    resources :inscriptions, only: [:index, :edit, :update, :destroy]
  end
  resources :admins, only: :index
  devise_for :users

  get 'courses/home'
  resources :courses, only: [:index, :show] do
    member do
      get :init_transmission
      get :get_token
      get :info
    end
  end

  resources :inscriptions, only: :create do
    collection do
      get :courses
    end
  end
  root 'courses#home'
  resources :integrants, only: [:index] do  
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
