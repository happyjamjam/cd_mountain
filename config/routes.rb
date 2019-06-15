Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admins/passwords',
  	registrations: 'admins/registrations'
  }

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
  resources :users, only: [:show]
  resources :products, only:[:index, :show]
  resources :contacts, only:[:new, :create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
