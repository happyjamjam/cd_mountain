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
    resources :artist, only: [:create, :edit]
    resources :disks, only: [:create, :update, :destroy]
    resources :musics, only: [:create, :update, :destroy]
    resources :labals, only: [:create, :update]
    resources :genres, only: [:create, :update]
    resources :orders, only: [:index, :show]

  end


  resources :products do
    resources :reviews, only: [:edit, :update, :destroy,:new,:create]
    resource :favorite, only: [:create, :destroy]
  end

  root to: "products#index"
  resources :users, only: [:show]
  resources :carts, only:[:index, :create, :update, :destroy]
  get 'orders/confirm' => 'orders#confirm'
  resources :orders, only:[:create, :show, :index]
  resources :contacts, only:[:new, :create]
end
