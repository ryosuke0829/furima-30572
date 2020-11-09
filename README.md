# DB 設計

## users table

| Column             | Type                | Options           |
|--------------------|---------------------|-------------------|
| email              | string              | null: false       |
| password           | string              | null: false       |
| nickname           | string              | null: false       |
| birth_date         | date                | null: false       |
| first_name         | string              | null: false       |
| last_name          | string              | null: false       |
| first_name_kana    | string              | null: false       |
| last_name_kana     | string              | null: false       |


### Association

* has_many :items
* has_many :orders

## items table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| user               | references | foreign_key: true |
| name               | string     | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| price              | integer    | null: false       |
| handling_charge_id | integer    | null: false       |
| description        | text       | null: false       |
| prefecture_id      | integer    | null: false       |
| shipping_date_id   | integer    | null: false       |


### Association

- belongs_to :user
- has_one :orders

## orders table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| postal_code     | string     | null: false       |
| prefectures_id  | integer    | null: false       |
| city            | string     | null: false       |
| street_number   | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |
| order           | references | null: false       |

### Association

- belongs_to :orders
