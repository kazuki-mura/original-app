# README

# users テーブル
| Column             | Type       | Options                  |
| ------------------ | ------     | -----------              |
| name               | string     | null: false              | 
| email              | string     | null: false, unique: true|

### Association
- has_many :schedules


## schedules テーブル
| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| client             | string     | null: false |
| parson             | string     |             |
| content            | integer    | null: false |
| purpose            | text       |             |
| time               | integer    | null: false |
| product            | integer    | null: false |
| report             | text       |             |
| other              | text       |             |
| response           | integer    | null: false |
| user_id            | references | null: false, foreign_key: true|

### Association
- belongs_to :user