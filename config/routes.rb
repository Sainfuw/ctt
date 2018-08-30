Rails.application.routes.draw do
  get 'inscriptions/courses'
  get 'inscription/:id/ayudantes', to: 'inscriptions#ayudantes', as: 'inscription_ayudantes'
  get 'inscription/:id/alumnos', to: 'inscriptions#alumnos', as: 'inscription_alumnos'
  resources :inscriptions, only: [:new, :create]
  namespace :admins do
    resources :users
    resources :courses #, except: [:create]
    #post 'courses', to: 'courses#create', as: 'course'
    resources :inscriptions, only: [:index, :edit, :update]
  end
  devise_for :users
  resources :courses do
    member do
      get :init_transmission
    end
  end
  root 'courses#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
