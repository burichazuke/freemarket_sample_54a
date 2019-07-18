crumb :mypages do
  link "マイページ", mypage_index_path
end

crumb :notification do
  link "お知らせ", notification_mypage_index_path 
  parent :mypages
end

crumb :todo do
  link "やることリスト", todo_mypage_index_path
  parent :mypages
end

crumb :like do
  link "いいね一覧", mypage_like_history_path
  parent :mypages
end

crumb :listing do
  link "出品した商品-出品中", mypage_listings_listing_path
  parent :mypages
end

crumb :in_progress do
  link "出品した商品-取引中", mypage_listings_in_progress_path
  parent :mypages
end

crumb :completed do
  link "出品した商品-売却済", mypage_listings_completed_path
  parent :mypages
end

crumb :purchase do
  link "購入した商品-取引中", purchase_mypage_index_path
  parent :mypages
end

crumb :purchased do
  link "購入した商品-過去の取引", purchased_mypage_index_path
  parent :mypages
end

crumb :news do
  link "ニュース一覧", news_mypage_inde_path
  parent :mypages
end

crumb :review do
  link "評価一覧", mypage_review_history_path
  parent :mypages 
end

crumb :help_center do
  link "ガイド", help_center_mypage_index_path
  parent :mypages
end

crumb :support do
  link "お問い合わせ", support_mypage_index_path
  parent :mypages
end

crumb :sales do
  link "売上・振込申請", sales_mypage_index_path
  parent :mypages
end

crumb :point do
  link "ポイント", point_mypage_index_path
  parent :mypages
end

crumb :profile do 
  link "プロフィール", profile_mypage_index_path
  parent :mypages
end

crumb :card do
  link "支払い方法", card_mypage_index_path
  parent :mypages
end

crumb :email_password do
  link "メール/パスワード", email_password_mypage_index_path
  parent :mypages
end

crumb :identification do
  link "本人確認", identification_mypage_index_path
  parent :mypages
end

crumb :sms_confirmation do
  link "電話番号の確認", sms_confirmation_mypage_index_path
  parent :mypages
end

crumb :logout do
  link "ログアウト", logout_path
  parent :mypages
end

