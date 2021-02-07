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

## users table

| Column             | Type   | Options                          |
|--------------------|--------|----------------------------------|
| nickname           | string | presence: true                   |
| email              | string | presence: true, uniqueness: true |
| encrypted_password | string | presence: true                   |
| last_name          | string | presence: true                   |
| first_name         | string | presence: true                   |
| last_name_kana     | string | presence: true                   |
| first_name_kana    | string | presence: true                   |
| birth_date         | date   | presence: true                   |

### Association

* has_many :items
* has_many :purchases

## items table

| Column           | Type       | Options                           |
|------------------|------------|-----------------------------------|
| item_name        | string     | presence: true                    |
| description      | text       | presence: true                    |
| category_id      | integer    | presence: true                    |
| condition_id     | integer    | presence: true                    |
| postage_payer_id | integer    | presence: true                    |
| prefecture_id    | integer    | presence: true                    |
| ship_date_id     | integer    | presence: true                    |
| price            | integer    | presence: true                    |
| user             | references | presence: true, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases table

| Column | Type       | Options                           |
|--------|------------|-----------------------------------|
| item   | references | presence: true, foreign_key: true |
| user   | references | presence: true, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses table

| Column        | Type       | Options                           |
|---------------|------------|-----------------------------------|
| post_code     | string     | presence: true                    |
| prefecture_id | integer    | presence: true                    |
| city          | string     | presence: true                    |
| address       | string     | presence: true                    |
| building_name | string     |                                   |
| phone_number  | string     | presence: true                    |
| purchase      | references | presence: true, foreign_key: true |

### Association

- belongs_to :purchase
