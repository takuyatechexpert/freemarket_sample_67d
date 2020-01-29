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

## address テーブル
|Column|Type|Options|
|------|----|-------|
<!-- 送付先の名前 -->
|destination_first_name |integer|null: false|
|destination_family_name|integer|null: false|
<!-- postの方がいいか? -->
|postal_code            |integer|null: false| 
<!-- 都道府県 -->
|prefectures            |string|null: false|
<!-- 市町村 -->
|municipalities         |string|null: false|
<!-- 番地 -->
|address                |string|null: false|
<!-- マンション名など -->
|home_type              |string|null: false|
|tel                    |integer|null: false|
<!-- 外部キー -->
|user        |references|null: false, foreign_key: true|
### Association
- belongs_to :user

## cards テーブル
<!-- gem payjp使用 -->
|Column|Type|Options|
|------|----|-------|
|coustomer_id|string|null: false|
|card_id     |string|null: false|
<!-- 外部キー -->
|user        |references|null: false, foreign_key: true|
### Association
- belongs_to :user

## items テーブル
|Column|Type|Options|
|------|----|-------|
|name    |string|null: false|
|price   |integer|null: false|
|size    |string|null: false, unipue: true|
<!-- 配送料 チェックボックスを使用して数字を入れる -->
|delivery_charg|integer|null: false, unipue: true|
<!-- 発送日 チェックボックスを使用して数字を入れる -->
|shipment|integer|null: false, unipue: true|
<!-- 外部キー -->
|user    |references|null: false, foreign_key: true|
|brand   |references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
<!-- 購入者と出品者のid -->
|buyer   |references|foreign_key: true|
|seller  |references|foreign_key: true|
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
<!-- gem ancestry使用 -->
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
<!-- 外部キー -->
|item   |references|null: false, foreign_key: true|
### Association
- belongs_to :items

## images テーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
<!-- 外部キー -->
|item   |references|null: false, foreign_key: true|
### Association
- belongs_to :items