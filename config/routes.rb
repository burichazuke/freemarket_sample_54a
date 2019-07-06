Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,  only: [:index, :create, :show, :edit, :update]
  resources :items
  resources :categories,  only: [:index, :show]
  resources :brands,  only: [:index, :show]
end
