# README
**furima-38024**へようこそ！  
まだ始めたてなので見辛いかもしれませんがデータベースの設計図としてテーブル設計図を初めに載せます

---
# テーブル設計図

usersテーブル
|カラム|型|オプション|
|---                |---    |---        |
|nickname           |string |null:false |            ユーザー名
|email              |string |null:false,unique:true| メールアドレス
|encrypted_password |string |null:false |            パスワード
|last_name          |string |null:false |            名前
|first_name         |string |null:false |            苗字
|last_name_kana     |string |null:false |            名前カナ
|first_name_kana    |string |null:false |            苗字カナ
|birth_date         |date   |null:false |            生年月日

Association

- has_many :items
- has_many :orders

---
itemsテーブル
|カラム|型|オプション|
|---                         |---        |---        |
|item_name                   |string     |null:false |                    商品名
|item_info                   |text       |null:false |                    商品詳細
|item_category_id            |integer    |null:false |                    商品カテゴリー
|item_sales_status_id        |integer    |null:false |                    商品状態
|item_price                  |integer    |null:false |                    価格
|item_shipping_fee_status_id |integer    |null:false |                    配送料
|item_prefecture_id          |integer    |null:false |                    発送元地域
|item_scheduled_delivery_id  |integer    |null:false |                    配送日数
|user                        |references |null:false, foreign_key: true |

Association

- belongs_to :user
- has_one :order

---
ordersテーブル
|カラム|型|オプション|
|---            |---        |---        |
|item           |references |null:false, foreign_key: true |
|user           |references |null:false, foreign_key: true |

Association

- belongs_to :item
- belongs_to :user
- has_one :address

addressesテーブル
|カラム|型|オプション|
|---                |---        |---        |
|postal_code        |string     |null:false | 郵便番号
|item_prefecture_id |integer    |null:false | 地域
|city               |string     |null:false | 市区町村
|addresses          |string     |null:false | 番地
|building           |string     |           | 建物名
|phone_number       |string     |null:false | 番地
|order              |references |null:false, foreign_key: true |

Association

- belongs_to :order