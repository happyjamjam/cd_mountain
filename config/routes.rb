Rails.application.routes.draw do

  namespace :admin do
    get 'reviews/edit'
  end
  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admins/passwords',
  	registrations: 'admins/registrations'
  }

  devise_for :users

  namespace :admin do
  	root to: "contacts#index"
  	resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :contacts, only: [:index, :show, :destroy]
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
  resources :users, only: [:show]
  resources :products, only:[:index, :show]
  resources :carts, only:[:index, :create, :update, :destroy]

end
