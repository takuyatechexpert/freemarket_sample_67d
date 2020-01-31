# freemarket DB設計

## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname               |string|null:false, unique: true|
|email                  |string|null: false|
|password               |string|null: false|
|family_name            |string|null: false|
|first_name             |string|null: false|
|family_name_kana       |string|null: false|
|first_name_kana        |string|null: false|
|birth_day              |integer|null: false|
### Association
- has_many :items
- has_many :cards
- has_many :addresses

## addresses テーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name |integer|null: false|
|destination_family_name|integer|null: false|
|postal_code            |integer|null: false| 
|prefectures            |string|null: false|
|municipalities         |string|null: false|
|address                |string|null: false|
|home_type              |string|null: false|
|tel                    |integer|null: false|
|user                   |references|null: false, foreign_key: true|
- municipalities 市町村
- destination_first_name, destination_family_name 送付先の名前 
- prefectures 都道府県
- 番地 address 番地 \
- home_type マンション名など
### Association
- belongs_to :user

## cards テーブル
|Column|Type|Options|
|------|----|-------|
|coustomer_id|string|null: false|
|card_id     |string|null: false|
|user        |references|null: false, foreign_key: true|
- gem payjp使用
### Association
- belongs_to :user

## items テーブル
|Column|Type|Options|
|------|----|-------|
|name          |string|null: false|
|price         |integer|null: false|
|size          |string|null: false, unipue: true|
|delivery_charg|integer|null: false, unipue: true|
|shipment      |integer|null: false, unipue: true|
|user          |references|null: false, foreign_key: true|
|brand         |references|null: false, foreign_key: true|
|category      |references|null: false, foreign_key: true|
|buyer         |integer|foreign_key: true|
|seller        |integer|foreign_key: true|
- 配送料 チェックボックスを使用して数字を入れる
- 発送日 shipmentチェックボックスを使用して数字を入れる
- 購入者と出品者のid buyer, seller
### Association
- has_many :comments
- has_many :images
- belongs_to :user
- belongs_to :brand, dependent: :delete
- belongs_to :category, dependent: :delete

## categorys テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry     |string|null: false|
- gem ancestry使用
### Association
- has_many :items

## brands テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## comments テーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|item   |references|null: false, foreign_key: true|
### Association
- belongs_to :item

## images テーブル
|Column|Type|Options|
|------|----|-------|
|image  |string|null: false|
|item   |references|null: false, foreign_key: true|
### Association
- belongs_to :items