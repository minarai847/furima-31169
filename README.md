# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
|first_name     | string | null: false |
|last_name      | string | null:false  |
|first_name_kana| string |null:false   |
|last_name_kana | string |null:false   |
|birthday       | date   | null:false  |

### Association

- has_many :items
- has_many :orders

## item テーブル

| Column            | Type    |  Options    |
| ------            | ------  | ----------- |
| name              | string  | null: false |
| description       | text    | null:false  |
|category_id        | integer |null:false   |
|item_condition_id  | integer | null:false  |
|shipping_charges_id| integer | null:false  |
|shipping_area_id   | integer | null:false  |
|days_to_ship_id    | integer | null:false  |
|price              | integer |null:false   |


### Association

- belongs_to :user 
- has_one    :order


## orders テーブル

| Column   | Type    | Options           |
| ------   | ------  | -----------       |
|user_id   |integer  | foreign_key: true |
|item_id   |integer  | foreign_key: true|


### Association

- belongs_to: user
- belongs_to: item
- has_one   :address

## address テーブル

| Column        | Type    | Options         |
| ------        | ------  | -----------     |
| post_code     | string  | null: false     |
|municipalities |string   | null: false     |
|prefectures    |integer  |null:false       |
|address_number |string   | null: false     |
|phone_number   |string   | null:false      |
|building_name  |string   |                 |
|order_id       |integer  |foreign_key: true|

### Association


- belongs_to: order
