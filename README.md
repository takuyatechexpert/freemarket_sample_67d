# freemarket DB設計

## users テーブル
|Column|Type|Options|
|------|----|-------|
|name                   |string|null: false, null:false, unique: true|
|email                  |string|null: false|
|password               |string|null: false|
|family_name            |string|null: false|
|first_name             |string|null: false|
|family_name_kana       |string|null: false|
|first_name_kana        |string|null: false|
|birth_year             |integer|null: false|
|birth_month            |integer|null: false|
|birth_day              |integer|null: false|
<!-- 送付先の名前 -->
|destination_first_name |integer|null: false|
|destination_family_name|integer|null: false|
<!-- postの方がいいか? -->
|Postal_code            |integer|null: false| 
<!-- 都道府県 -->
|Prefectures            |string|null: false|
<!-- 市町村 -->
|Municipalities         |string|null: false|
<!-- 番地 -->
|address                |string|null: false|
<!-- マンション名など -->
|home_type              |string|null: false|
|tel                    |integer|null: false|
### Association
- has_many :orders
- has_many :items

## items テーブル
|Column|Type|Options|
|------|----|-------|
|item_name     |string|null: false|
|price         |integer|null: false|
|size          |string|null: false, unipue: true|
<!-- 配送料 チェックボックスを使用して数字を入れる -->
|delivery_charg|integer|null: false, unipue: true|
<!-- 発送日 チェックボックスを使用して数字を入れる -->
|shipment      |integer|null: false, unipue: true|
<!-- 外部キー -->
|user          |references|foreign_key: true|
|comment       |references|foreign_key: true|
|brand         |references|foreign_key: true|
|category      |references|foreign_key: true|
|image         |references|foreign_key: true|
<!-- 購入者と出品者のid -->
|buyer         |references|foreign_key: true|
|seller        |references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :comment
- belongs_to :image
- belongs_to :brand
- belongs_to :category
- has_many :orders
- has_many :orders, through: :order_items


## orders テーブル
|Column|Type|Options|
|------|----|-------|
|total_fee     |integer|null: false|
<!-- 外部キー -->
|user          |references|foreign_key: true|
### Association
- belongs_to :user
- has_many :items
- has_many :items, through: :order_items

## order_items テーブル
|Column|Type|Options|
|------|----|-------|
<!-- 商品の数 -->
|quantity|integer|null: false|
<!-- 外部キー -->
|user    |references|foreign_key: true|
|item    |references|foreign_key: true|
|order   |references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :comment

## categorys テーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|ancestry     |string|null: false|
<!-- gem ancestry使用 -->
### Association
- has_many :items

## brands テーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string|null: false|
<!-- 外部キー -->
|item      |references|foreign_key: true|
### Association
- has_many :items

## comments テーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
<!-- 外部キー -->
|item      |references|foreign_key: true|
### Association
- has_many :items

## images テーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
<!-- 外部キー -->
|item      |references|foreign_key: true|
### Association
- has_many :items