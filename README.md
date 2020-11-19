# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false |
| encrypted_password   | string  | null: false |
| family_name          | string  | null: false |
| first_name           | string  | null: false |
| family_name_katakana | string  | null: false |
| first_name_katakana  | string  | null: false |
| birthday             | date    | null: false |
### Association

-has_many : items
-has_many : purchase_record

##  items テーブル

| Column          | Type        | Options                      |
| --------------- | ----------- | ---------------------------- |
| name            | string      | null: false                  |
| explanation     | text        | null: false                  |
| price           | integer     | null: false                  |
| users           | references  | null: false,foreign_key:true |
| category_id     | integer     | null: false                  |
| status_id       | integer     | null: false                  |
| delivery_fee_id | integer     | null: false                  |
| send_area_id    | integer     | null: false                  |
| send_day_id     | integer     | null: false                  |

### Association

- belongs_to :user
- has_one :purchase_record

##  purchase_recordテーブル

| Column          | Type       | Options                               |
| --------------- | ---------- | ------------------------------------- |
| user            | references | null: false,foreign_key:true          |
| item            | references | null: false,foreign_key:true          |
| purchase_record | references | null: false,foreign_key:true          |


### Association

- belongs_to :user
- belongs_to :item
- has_one :street_address

##  street_address テーブル

| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| prefecture_id  | integer    | null: false                  |
| municipalities | string     | null: false                  |
| address        | string     | null: false,foreign_key:true |
| postal_code    | string     | null: false,foreign_key:true |
| phone_number   | string     | null: false,foreign_key:true |
| building       | string     | null: false,foreign_key:true |

### Association
- belongs_to :purchase_record