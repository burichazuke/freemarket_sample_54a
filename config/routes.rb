Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: {
    sessions: 'users/sessions',
    # passwords: 'users/passwords'
    # ToDo: facebook認証に応じて追加
    # omniauth_callbacks: "users/omniauth_callbacks"
  }
  as :user do
    get 'users/sign_up/registration', to: 'users/registrations#new', as: :user_registration
    get 'users/sign_up', to: 'users/registrations#register', as: :register_user_registration
    post 'users/sign_up/sms_confirmation', to: 'users/registrations#validation', as: :user_validation
    get 'users/sign_up/sms_confirmation', to: 'users/registrations#sms_confirmation', as: :sms_confirmation_user_registration
    post 'users/sign_up/add_phone_number', to: 'users/registrations#add_phone_number', as: :add_phone_number
    get 'users/sign_up/sms_confirmation/sms', to: 'users/registrations#verification_code_input', as: :verification_code_input
    post 'users/sign_up/verification', to: 'users/registrations#verification', as: :verification
    get 'users/sign_up/address', to: 'users/registrations#address', as: :address_user_registration
    get 'users/sign_up/credit_card', to: 'users/registrations#credit_card', as: :credit_card_user_registration
    get 'users/sign_up/finish', to: 'users/registrations#finish', as: :finish_user_registration
    post 'users', to: 'users/registrations#create', as: :create_user_registration
    get 'users/:id', to: 'users#show', as: :show_user_plofile
    # get 'mypage/email_password', to: 'users/registrations#edit', as: :email_password_mypage_index
    # get 'mypage/email_password/confirmation', to: 'users/registrations#update_confirmation', as: :email_password_confirmation_mypage_index
    put 'mypage/email_password', to: 'users/registrations#update', as: :update_user_registration
  end

  root to: "items#index"
  resources :mypage, only: [:index] do
    collection do
      get "notification", "todo", "purchase", "purchased", "news", "support", "sales", "point", "profile", "email_password", "confirmation", "identification", "sms_confirmation", "help_center"
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
    patch "mypage/profile", to: "mypage#update_profile"
  end

  as :address do 
    get 'mypage/deliver_address', to: 'addresses#edit', as: :edit_address  
    post 'address', to: 'addresses#create', as: :create_address
    patch 'address', to: 'addresses#update', as: :update_address
  end
  
  as :items do
    get "transaction/done/:id", to: "items#done", as: :items_done
    get "transaction/buy/:id", to: "items#buy", as: :items_buy
    patch "transaction/pay/:id", to: "items#pay", as: :items_pay
    get "items/sell", to: "items#new", as: :items_sell
    get "items/search", to: "items#search"
  end
  
  resources :items, except: :new do
    collection do
      get "category_parent", defaults: {format:'json'} 
      get 'category_children', defaults: {format:'json'}
      get 'category_grandchildren', defaults: {format:'json'}
    end
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :categories,  only: [:index, :show] 
  resources :brands,  only: [:index, :show]
  resources :cards, only: [:new, :create, :destroy,]
  as :cards do
    get "mypage/card", to: "cards#card"
  end

  # 一番下に置いてください↓
  get '*path', controller: 'application', action: 'render_404'

end

