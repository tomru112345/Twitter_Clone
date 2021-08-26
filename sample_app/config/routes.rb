Rails.application.routes.draw do
  resource :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resource :settings, only: [:edit, :update]

  resources :users, only: [:index, :show] do
    resource :follows, only: [:create, :destroy] 
    get :favorites, on: :member
    get :follows, on: :member
    get :followers, on: :member 
  end 

  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resource :doubts, only: [:create, :destroy]
    get :timeline, on: :collection 
  end 

  resources :notifications, only: [:index]
  
  root to: 'registrations#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
