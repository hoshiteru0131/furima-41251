# テーブル設計

## Users Table
| Column              | Type      | Options                       |
|---------------------|-----------|-------------------------------|
| id                  | integer   | primary key                   |
| nickname            | string    | null: false                   |
| email               | string    | null: false, unique: true     |
| encrypted_password  | string    | null: false                   |
| name                | string    | null: false                   |
| name_kana           | string    | null: false                   |
| birth_date          | date      | null: false                   |

### Associations
- has_many :items
- has_many :purchases
- has_many :addresses

## Items Table
| Column      | Type      | Options                       |
|-------------|-----------|-------------------------------|
| id          | integer   | primary key                   |
| name        | string    | null: false                   |
| description | text      | null: false                   |
| category    | string    | null: false                   |
| condition   | string    | null: false                   |
| price       | integer   | null: false                   |
| user_id     | integer   | null: false, foreign key      |

### Associations
- belongs_to :user
- has_many :purchases
- has_many :addresses
- has_one_attached :image

## Purchases Table
| Column      | Type      | Options                       |
|-------------|-----------|-------------------------------|
| id          | integer   | primary key                   |
| user_id     | integer   | null: false, foreign key      |
| item_id     | integer   | null: false, foreign key      |


### Associations
- belongs_to :user
- belongs_to :item
- has_one :address

## Addresses Table
| Column       | Type      | Options                       |
|--------------|-----------|-------------------------------|
| id           | integer   | primary key                   |
| postal_code  | string    | null: false                   |
| prefecture   | string    | null: false                   |
| city         | string    | null: false                   |
| street       | string    | null: false                   |
| building     | string    |                               |
| phone_number | string    | null: false                   |
| purchase_id  | integer   | null: false, foreign key      |


### Associations
- belongs_to :purchase