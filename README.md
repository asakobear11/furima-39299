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
- has_many :buyers
- has_many :address

## items テーブル

| Colum                | Type        | Options                        |
| -------------------- | ------      | ------------------------------ |
| item_name            | string      | null: false                    |
| description          | text        | null: false                    |
| details_category_id  | integer     | null: false                    |
| details_condition_id | integer     | null: false                    |
| delivery_cost_id     | integer     | null: false                    |
| delivery_area_id     | integer     | null: false                    |
| delivery_date_id     | integer     | null: false                    |
| price                | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |
| address              | references  | null: false, foreign_key: true |
| buyer                | references  | null: false, foreign_key: true |


### Association

- belong_to :user
- belong_to :address
- belong_to :buyer

## buyers テーブル

| Colum               | Type        | Options                        |
| ------------------- | ------      | ------------------------------ |
| user                | references  | null: false, foreign_key: true |

### Association

- belong_to :user
- has_many :items
- has_many :addresses

## addresses テーブル

| Colum               | Type        | Options                        |
| ------------------- | ------      | ------------------------------ |
| postcode            | string      | null: false                    |
| prefecture_id       | integer     | null: false                    |
| city                | string      | null: false                    |
| block               | string      | null: false                    |
| building            | string      |                                |
| phone_number        | string      | null: false                    |
| user                | references  | null: false                    |
| buyer               | references  | null: false, foreign_key: true |

### Association

- belong_to :buyer