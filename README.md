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

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| family_name           | string  | null: false |
| first_name            | string  | null: false |
| family_name_katakana  | string  | null: false |
| first_name_katakana   | string  | null: false |
| year                  | integer | null: false |
| month                 | integer | null: false |
| day                   | integer | null: false |

### Association

-has_many : items
-has_many : purchase_record

##  items テーブル

| Column       | Type        | Options                      |
| ------------ | ----------- | ---------------------------- |
| name         | string      | null: false                  |
| explanation  | string      | null: false                  |
| price        | integer     | null: false                  |
| users        | references  | null: false,foreign_key:true |
| category     | integer     | null: false                  |
| status       | integer     | null: false                  |
| delivery_fee | integer     | null: false                  |
| send_area    | integer     | null: false                  |
| send_day     | integer     | null: false                  |

### Association

- belongs_to :users
- has_one :purchase_record

##  purchase_recordテーブル

| Column | Type       | Options                      |
| ------ | ---------- | ---------------------------- |
| users  | references | null: false,foreign_key:true |
| items  | references | null: false,foreign_key:true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :street_address

##  street_address テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| prefecture     | integer | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| postal_code    | string  | null: false |
| phone_number   | string  | null: false |
| building       | string  | null: false |

### Association
- belongs_to :purchase_record