# テーブル設計

## users テーブル

| Colum               | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name_kanji     | string | null: false               |
| first_name_kanji    | string | null: false               |
| last_name_kana      | string | null: false               |
| first_name_kana     | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Colum                | Type        | Options                        |
| -------------------- | ------      | ------------------------------ |
| item_name            | string      | null: false                    |
| description          | text        | null: false                    |
| details_category_id  | integer     | null: false                    |
| details_condition_id | integer     | null: false                    |
| delivery_cost_id     | integer     | null: false                    |
| prefecture_id        | integer     | null: false                    |
| delivery_date_id     | integer     | null: false                    |
| price                | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Colum               | Type        | Options                        |
| ------------------- | ------      | ------------------------------ |
| user                | references  | null: false, foreign_key: true |
| item                | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Colum               | Type        | Options                        |
| ------------------- | ------      | ------------------------------ |
| postcode            | string      | null: false                    |
| prefecture_id       | integer     | null: false                    |
| city                | string      | null: false                    |
| block               | string      | null: false                    |
| building            | string      |                                |
| phone_number        | string      | null: false                    |
| order               | references  | null: false, foreign_key: true |

### Association

- belongs_to :order