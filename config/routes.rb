Rails.application.routes.draw do
  namespace :admins do
    resources :users, except: :new
    resources :courses #, except: [:create]
    #post 'courses', to: 'courses#create', as: 'course'
    resources :inscriptions, only: [:index, :edit, :update]
  end
  resources :admins, only: :index
  devise_for :users
  get 'courses/home'
  get 'course/:id/info', to: 'courses#info', as: 'course_info'
  resources :courses, only: [:index, :show]
  get 'inscriptions/courses'
  get 'inscription/:id', to: 'inscriptions#new', as: 'inscription_new'
  root 'courses#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
