Rails.application.routes.draw do

  devise_for :users
  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admins/passwords',
  	registrations: 'admins/registrations'
  }


  namespace :admin do
  	root to: "contacts#index"
  	resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :contacts, only: [:index, :show, :destroy, :update]
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


  resources :products do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resource :favorite, only: [:create, :destroy]
    resources :carts, only: [:create]
  end

  root to: "products#index"
  resources :users, only: [:show]
  resources :addresses, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :carts, only: [:index, :update, :destroy]
  get 'orders/confirm' => 'orders#confirm'
  resources :orders, only:[:create, :show, :index]
  resources :contacts, only:[:new, :create]
  resources :order_details, only: [:create]
end
