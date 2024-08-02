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
- has_many :purchases

## Items Table
| Column        | Type      | Options                       |
|---------------|-----------|-------------------------------|
| name          | string    | null: false                   |
| description   | text      | null: false                   |
| category      | string    | null: false                   |
| condition     | string    | null: false                   |
| shipping_fee  | integer   | null: false, foreign key      |
| prefecture_id | integer   | null: false, foreign key      |
| shipping_days | integer   | null: false, foreign key      |
| price         | integer   | null: false                   |
| user_id       | integer   | null: false, foreign key      |

### Associations
- belongs_to :user
- belongs_to :purchases
- has_one_attached :image

## Purchases Table
| Column   | Type       | Options                       |
|----------|------------|-------------------------------|
| user     | references | null: false, foreign key      |
| item     | references | null: false, foreign key      |


### Associations
- belongs_to :user
- belongs_to :item
- has_one :address

## Addresses Table
| Column        | Type       | Options                       |
|---------------|------------|-------------------------------|
| postal_code   | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| street        | string     | null: false                   |
| building      | string     |                               |
| phone_number  | string     | null: false                   |
| purchase_id   | references | null: false, foreign key      |


### Associations
- belongs_to :purchase