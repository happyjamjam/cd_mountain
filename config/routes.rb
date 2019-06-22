Rails.application.routes.draw do

  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admins/passwords',
  	registrations: 'admins/registrations'
  }

  devise_for :users

  namespace :admin do
  	root to: "contacts#index"
  	resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :contacts, only: [:index, :show, :new, :create, :update]
    resources :products do
      resources :reviews, only: [:edit, :update, :destroy]
    end
    resources :artists, only: [:create, :edit, :new]
    resources :disks, only: [:create, :update, :destroy]
    resources :musics, only: [:create, :update, :destroy]
    resources :labals, only: [:create, :update]
    resources :genres, only: [:create, :update]
    resources :orders, only: [:index, :show]

  end

  root to: "products#index"
  resources :users, only: [:show]
  resources :products do
    resources :reviews, only: [:edit, :update, :destroy,:new,:create]
    resource :favorite, only: [:create, :destroy]
  end

  root to: "products#index"
  resources :users, only: [:show]
  resources :carts, only:[:index, :create, :update, :destroy]
  get 'orders/confirm' => 'orders#confirm'
  resources :orders, only:[:create, :show, :index]

end
