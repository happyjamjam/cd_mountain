Rails.application.routes.draw do
  namespace :admin do
  	root to: "contacts#index"
  	resources :users, only: [:index, :show, :edit, :update]
    resources :contacts, only: [:index, :show, :new, :create, :update]
    resources :reviews, only: [:edit, :update, :destroy]
    resources :products
    resources :artist, only: [:create, :edit]
    resources :disks, only: [:create, :update, :destroy]
    resources :musics, only: [:create, :update, :destroy]
    resources :labals, only: [:create, :update]
    resources :genres, only: [:create, :update]
    resources :orders, only: [:index, :show]
  end
  root to: "products#index"
  resources :products, only:[:index, :show]
  devise_for :admins
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
