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
    get 'users/sign_up/sms_confirmation', to: 'users/registrations#sms_confirmation', as: :sms_confirmation_user_registration
    get 'users/sign_up/address', to: 'users/registrations#address', as: :address_user_registration
    get 'users/sign_up/credit_card', to: 'users/registrations#credit_card', as: :credit_card_user_registration
    get 'users/sign_up/finish', to: 'users/registrations#finish', as: :finish_user_registration
    post 'users', to: 'users/registrations#create', as: :create_user_registration
    # ToDo: マイページに応じて、要追加
    # get 'users/edit', to: 'users/registrations#edit', as: :edit_user_registration
    # patch 'users', to: 'users/registrations#update', as: :update_user_registration
    # delete 'users', to: 'users/registrations#destroy', as: :destroy_user_registration
    # get 'users/cancel', to: 'users/registrations#cancell', as: :cancel_user_registration
  end

  root to: "items#index"
  resources :users,  only: [:show]
  resources :mypage, only: [:index] do
    collection do
      get "notification", "todo", "purchase", "purchased", "news", "support", "sales", "point", "profile", "card", "email_password", "identification", "sms_confirmation", "help_center"
    end
  end

  as :mypage do
    post "identification", to: "mypage#create_identification"
    patch "identification", to: "mypage#create_identification"
    get "mypage/like/history", to: "mypage#like"
    get "mypage/listings/listing", to: "mypage#listing"
    get "mypage/listings/in_progress", to: "mypage#in_progress"
    get "mypage/listings/completed", to: "mypage#completed"
    get "mypage/review/history", to: "mypage#review"
    get "logout", to: "mypage#logout"
  end

  as :address do 
    get 'mypage/deliver_address', to: 'addresses#edit', as: :edit_address  
    post 'address', to: 'addresses#create', as: :create_address
    patch 'address', to: 'addresses#update', as: :update_address
  end
  
  as :items do
    get "transaction/buy/:id", to: "items#buy", as: :items_buy
    patch "transaction/pay/:id", to: "items#pay", as: :items_pay
    get "items/sell", to: "items#new", as: :items_sell
    get "items/search", to: "items#search"
  end
  resources :items, except: :new 
    resource :favorites, only: [:create, :destroy]
  

    resources :comments, only:[:create, :destroy]
  resources :categories,  only: [:index, :show]
  resources :brands,  only: [:index, :show]
  resources :cards, only: [:new, :create,:destroy,] do
  end

end
