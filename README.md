# テーブル設計

## users テーブル

| Colum               | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false, unique: true |
| email               | string | null: false, unique: true |
| password            | string | null: false, unique: true |
| name_kanji          | string | null: false               |
| name_kana           | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :buyers
- has_many :addresses

## items テーブル

| Colum               | Type        | Options                        |
| ------------------- | ------      | ------------------------------ |
| image               | string      | null: false, unique: true      |
| item_name           | string      | null: false, unique: true      |
| description         | string      | null: false                    |
| details             | string      | null: false                    |
| delivery            | string      | null: false                    |
| price               | integer     | null: false                    |
| user                | refereneces | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :address
- has_one :buyer

## buyers テーブル

| Colum               | Type        | Options                        |
| ------------------- | ------      | ------------------------------ |
| user                | refereneces | null: false, foreign_key: true |
| item                | refereneces | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one :item
- has_one :address

## addresses テーブル

| Colum               | Type        | Options                        |
| ------------------- | ------      | ------------------------------ |
| postcode            | string      | null: false                    |
| prefecture          | string      | null: false                    |
| city                | string      | null: false                    |
| block               | string      | null: false                    |
| building            | string      | null: false                    |
| phone_number        | string      | null: false                    |
| user                | refereneces | null: false, foreign_key: true |
| buyer               | refereneces | null: false, foreign_key: true |

### Association

- has_many :items
- belong_to :user
- has_one :buyer