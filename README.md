# README
**furima-38024**へようこそ！  
まだ始めたてなので見辛いかもしれませんがデータベースの設計図としてテーブル設計図を初めに載せます

---
# テーブル設計図

usersテーブル
|レコード|型|制約|外部キー制約|
|---                |---    |---      |---        |
|nickname           |string |NOT NULL |           |   ユーザー名
|email              |string |NOT NULL |ユニーク制約 |   メールアドレス
|encrypted_password |string |NOT NULL |           |   パスワード

Association

- has_many :items
- has_many :buyers

---
itemsテーブル
|レコード|型|空で保存可能？|制約|
|---              |---        |---      |---    |
|item-name        |string     |NOT NULL |       |   商品名
|item-explain     |string     |NOT NULL |       |   商品詳細
|item-category    |string     |NOT NULL |       |   商品カテゴリー
|item-condition   |string     |NOT NULL |       |   商品状態
|item-price       |integer    |NOT NULL |       |   価格
|user             |references |NOT NULL |外部キー|

Association

- belongs_to :user
- has_one :buyer

---
buyerテーブル
|レコード|型|空で保存可能？|制約|
|---              |---        |---      |---    |
|address          |string     |NOT NULL |       |   配送先情報
|delivery-charge  |integer    |NOT NULL |       |   配送料
|item             |references |NOT NULL |外部キー|
|user             |references |NOT NULL |外部キー|

Association

- belongs_to :item
- belongs_to :user
