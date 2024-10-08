# テーブル設計

## Users Table
| Column              | Type      | Options                       |
|---------------------|-----------|-------------------------------|
| nickname            | string    | null: false                   |
| email               | string    | null: false, unique: true     |
| encrypted_password  | string    | null: false                   | 
| last_name_kanji     | string    | null: false                   |
| first_name_kanji    | string    | null: false                   |
| last_name_kana      | string    | null: false                   |
| first_name_kana     | string    | null: false                   |
| birth_date          | date      | null: false                   |

### Associations
- has_many :items
- has_many :orders

## Items Table
| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------| 
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- has_one :order
- has_one_attached :image

## Orders Table
| Column   | Type       | Options                       |
|----------|------------|-------------------------------|
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |


### Associations
- belongs_to :user
- belongs_to :item
- has_one :address

## Addresses Table
| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |


### Associations
- belongs_to :order