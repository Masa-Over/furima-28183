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

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |

### Association

-has_many : items
-has_many : purchase_record

##  items テーブル

| Column   | Type       | Options                      |
| -------- | ---------- | ---------------------------- |
| name     | string     | null: false                  |
| price    | string     | null: false                  |
| users_id | references | null: false,foreign_key:true |
| image    | string     | null: false                  |
| category | string     | null: false                  |
| status   | string     | null: false                  |

### Association

- belongs_to :users
- has_one :purchase_record

##  purchase_recordテーブル

| Column   | Type       | Options                      |
| -------- | ---------- | ---------------------------- |
| users_id | references | null: false,foreign_key:true |
| date     | string     | null: false                  |
| items_id | references | null: false,foreign_key:true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :street_address

##  street_address テーブル

| Column         | Type   | Options      |
| -------------- | ------ | ------------ |
| prefecture     | string | null: false  |
| municipalities | string | null: false  |
| address        | string | null: false  |
| postal_code    | string | null: false  |
| phone_number   | string | null: false  |

### Association
- belongs_to :purchase_record