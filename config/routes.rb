Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/create'
  get 'contacts/update'
  resources :products, only:[:index, :show]
  devise_for :admins
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
