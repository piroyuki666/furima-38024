# README
**furima-38024**へようこそ！  
まだ始めたてなので見辛いかもしれませんがデータベースの設計図としてテーブル設計図を初めに載せます

---
# テーブル設計図

usersテーブル
|カラム|型|オプション|
|---                |---     |---        |
|nickname           |string  |null:false |            ユーザー名
|email              |string  |null:false,unique:true| メールアドレス
|encrypted_password |string  |null:false |            パスワード
|last-name          |string  |null:false |            ユーザー名
|first-name         |string  |null:false |            ユーザー名
|last-name-kana     |string  |null:false |            ユーザー名
|first-name-kana    |string  |null:false |            ユーザー名
|birth-date_id      |integer |null:false |            ユーザー名

Association

- has_many :items
- has_many :orders

---
itemsテーブル
|カラム|型|オプション|
|---                         |---        |---        |
|item-name                   |text       |null:false |                    商品名
|item-info                   |text       |null:false |                    商品詳細
|item-category_id            |integer    |null:false |                    商品カテゴリー
|item-sales-status_id        |integer    |null:false |                    商品状態
|item-price                  |integer    |null:false |                    価格
|item-shipping-fee-status_id |integer    |null:false |                    配送料
|item-prefecture_id          |integer    |null:false |                    発送元地域
|item-scheduled-delivery_id  |integer    |null:false |                    配送日数
|user                        |references |null:false, foreign_key: true |

Association

- belongs_to :user
- has_one :order

---
ordersテーブル
|カラム|型|オプション|
|---            |---        |---        |
|card-number    |string     |null:false |                   カード番号
|card-exp-month |integer    |null:false |                   有効期限の月
|card-exp-year  |integer    |null:false |                   有効期限の年
|card-cvc       |integer    |null:false |                   セキュリティコード
|item           |references |null:false, foreign_key: true |
|user           |references |null:false, foreign_key: true |

Association

- belongs_to :item
- belongs_to :user
- has_one :delivery-address

delivery-addressテーブル
|カラム|型|オプション|
|---            |---     |---        |
|postal-code    |integer |null:false | 郵便番号
|prefecture_id  |integer |null:false | 都道府県
|city           |string  |null:false | 市区町村
|addresses      |string  |null:false | 番地
|building       |string  |           | 建物名
|phone-number   |string  |null:false | 番地

Association

- belongs_to :order