# README

* Ruby version

* System dependencies

* Configuration

* Database creation
# DB設計
#### 以下、timestampsは全ての動的テーブルに用意。

## usersテーブル
|Column|Type|Options|
|------|-----|-------|
|nickname|string|null: false|
|email|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|
|phone|integer|null: false|
|wallet|integer|null: false|
#### 上記に加えてpassword関連も用意。
### Association
- has_many :bought_items,, foreign_key: "buyer_id", class_name: "Item"
- has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item" 
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
- has_one :credit_card, index: { unique: true } ,foreign_key: "credit_card_id"
- has_one :address, foreign_key: "address_id"
- has_many :comments
- has_many :favorites
- has_many :favorite_items, through: :favorites, source: :item
- has_many :user_notifications
- has_many :users, through :user_notifications
### メモ　後々余裕があれば
- has_many :buy_dealing_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :sell_dealing_items, foreign_key: "seller_id", class_name: "Item"


## addressesテーブル
|Column|Type|Options|
|------|-----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|building|string|-|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user, foreign_key: "user_id"

## credit_cardsテーブル（pay.jpを要確認）
|Column|Type|Options|
|------|-----|-------|
|number|integer|null: false|
|valid_year|integer|null: false|
|valid_month|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user, foreign_key: "user_id"

## Gradesテーブル
|Column|Type|Options|
|------|-----|-------|
|rank|integer|limit: 2|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|size|string|-|
|brand_id|integer|foreign_key: true|
|condition|string|null: false|
|shipping_fee|string|null: false|
|shipping_method|string|null: false|
|prefecture|string|null: false|
|shipping_date|string|null: false|
|price|integer|null: false|
|profit|integer|null: false|
|status|integer|default: 0, null: false, limit: 2|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
### Association
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :images
- belongs_to_active_hash :category
- belongs_to_active_hash :brand
- has_many :comments
- has_many :favorites
- has_many :users, through: :favorites
### メモ
- validates :name, length: { in: 1..40 }
- statusはenumを使用。0: selling , 1:dealing, 2: sold_out
- prefectureはアソシエーションの必要ないかな。出品ページにprefectureDBから表示する


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item


## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## Favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## Categoriesテーブル（静的データ）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_ancestry
- has_many :items
- has_many :category_brands
- has_many_active_hash :brands, through :category_brands
### メモ
- gem 'ancestry'を使用

## Brandsテーブル（静的データ）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items
- has_many :category_brands
- has_many_active_hash :categories, through :category_brands

## Category_brandsテーブル（静的データ）
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null: false|
|category_id|integer|null: false|
### Association
- belongs_to_active_hash :category
- belongs_to_active_hash :brand


## Prefecturesテーブル（静的データ）
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## To-dosテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|user_id|string|null: false|
### Association
- belongs_to :user

## Informationsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|string|null: false|

## Notificationsテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
### Association
- has_many :user_notifications
- has_many :users, through :user_notifications

## User_notificationsテーブル
|Column|Type|Options|
|------|----|-------|
|notification_id|string|null: false|
|user_id|string|null: false|
### Association
- belongs_to :user
- belongs_to :notification

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
