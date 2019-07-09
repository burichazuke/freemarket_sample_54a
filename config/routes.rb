Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :users,  only: [:index, :create, :show, :edit, :update] 
  resources :mypage, only: [:index] do
    collection do
      get "notification", "todo", "purchase", "purchased", "news", "support", "profile", "deliver_address",
      "card", "email_password", "identification", "sms_confirmation", "help_center"
    end

  end
  as :mypage do
    get "mypage/like/history", to: "mypage#like"
    get "mypage/listings/listing", to: "mypage#listing"
    get "mypage/listings/in_progress", to: "mypage#in_progress"
    get "mypage/listings/completed", to: "mypage#completed"
    get "mypage/review/history", to: "mypage#review"
  end

  resources :items, except: :new do

  end
  as :items do
    get "transaction/buy/:id", to: "items#buy", as: :items_buy
    get "items/sell", to: "items#sell", as: :items_sell
  end

    resources :comments, only:[:create, :destroy]
  resources :categories,  only: [:index, :show]
  resources :brands,  only: [:index, :show]

end
