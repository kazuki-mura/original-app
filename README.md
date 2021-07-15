# README

# users テーブル
| Column             | Type       | Options                  |
| ------------------ | ------     | -----------              |
| last_name          | string     | null: false              |
| first_name         | string     | null: false              |
| email              | string     | null: false, unique: true|

### Association
- has_many :schedules


## schedules テーブル
| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| client             | string     | null: false |   <!-- 取引先様 -->
| parson             | string     |             |   <!-- 担当者様 -->
| content            | integer    | null: false |   <!-- 内容 -->
| aim                | text       |             |   <!-- 目的 -->
| time               | integer    |             |   <!-- 時間 -->
| product            | integer    | null: false |   <!-- 商品 -->
| report             | text       |             |   <!-- 活動報告 -->
| other              | text       |             |   <!-- その他 -->
| response           | integer    | null: false |   <!-- 手応え -->
| user_id            | references | null: false, foreign_key: true|

### Association
- belongs_to :user