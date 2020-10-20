# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| birth_date         | text                | null: false             |


### Association

* has_many :items
* has_many :purchases

## items table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| user              | references | foreign_key: true |
| name              | string     | null: false       |
| category_id       | integer    | null: false       |
| condition_id      | integer    | null: false       |
| price             | integer    | null: false       |
| image_id          | integer    | null: false       |
| handling_charge    | integer    | null: false       |
| description       | text       | null: false       |
| prefectures_id    | integer    | null: false       |


### Association

- belongs_to :users
- has_one :purchases

## purchases table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | oreign_key: true  |
| item        | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| postal_code     | string     | null: false       |
| prefectures_id  | integer    | null: false       |
| city            | string     | null: false       |
| street_number   | string     | null: false       |
| building_name   | string     | null: false       |
| phone_number    | string     | null: false       |

### Association

- belongs_to :purchases
