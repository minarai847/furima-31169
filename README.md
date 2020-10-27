# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
|first_name| string | null: false |
|last_name | string | null:false  |
|birthday  | string | null:false  |

### Association

- has_many :items
- has_many :orders
- has_one  :address

## item テーブル

| Column         | Type       |  Options    |
| ------         | ------     | ----------- |
| item_name      | string     | null: false |
|item_description| text       | null:false  |
|image           |ActiveStorage|null:false  |
|price           |string      |null:false   |


### Association

- belongs_to :user 
- has_one    :address
- has_one    :order


## orders テーブル

| Column   | Type    | Options           |
| ------   | ------  | -----------       |
| buyer    | string  | foreign_key: true |
| date     |string   | null:false        |
|item_id   |         | foreign_key: true|


### Association

- belongs_to: user
- has_one   : item
- has_one   :address

## address テーブル

| Column        | Type    | Options         |
| ------        | ------  | -----------     |
| post_code     | string  | null: false     |
|municipalities |string   | null: false     |
|address_number |string   | null: false     |
|phone_number   |string   | null:false      |
|building_name  |string   |                 |
|user_id        |         |foreign_key: true|
|order_id       |         |foreign_key: true|

### Association

- has_one: item
- has_one: user
- has_one: order
