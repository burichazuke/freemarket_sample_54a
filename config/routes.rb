Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
    # ToDo: facebook認証に応じて追加
    # omniauth_callbacks: "users/omniauth_callbacks"
  }
  as :user do
    get 'users/sign_up/registration', to: 'users/registrations#new', as: :user_registration
    get 'users/sign_up', to: 'users/registrations#register', as: :register_user_registration
    post 'users', to: 'users/registrations#create', as: :create_user_registration
    # ToDo: マイページに応じて、要追加
    # get 'users/edit', to: 'users/registrations#edit', as: :edit_user_registration
    # patch 'users', to: 'users/registrations#update', as: :update_user_registration
    # delete 'users', to: 'users/registrations#destroy', as: :destroy_user_registration
    # get 'users/cancel', to: 'users/registrations#cancell', as: :cancel_user_registration
  end

  root to 'items#index'
  resources :users,  only: [:index, :show]
  resources :items
    resources :comments, only:[:create, :destroy]
  resources :categories,  only: [:index, :show]
  resources :brands,  only: [:index, :show]
end
