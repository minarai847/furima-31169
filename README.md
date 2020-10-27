# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
|first_name  | string | null: false |
|last_name   | string | null:false  |
|F.first_name| string |null:false   |
|F.last_name | string |null:false   |
|birthday    | date   | null:false  |

### Association

- has_many :items
- has_many :orders
- has_one  :address

## item テーブル

| Column         | Type       |  Options    |
| ------         | ------     | ----------- |
| item_name      | string     | null: false |
|item_description| text       | null:false  |
|category        | ActiveHash | null:false  |
|item_condition  | ActiveHash |null:false   |
|shipping_charges| ActiveHash | null:false |
|shipping_area   | ActiveHash | null:false  ||days_to_ship    | ActiveHash | null:false  |
|image           |ActiveStorage|null:false  |
|price           |string      |null:false   |


### Association

- belongs_to :user 
- has_one    :address
- has_one    :order


## orders テーブル

| Column   | Type    | Options           |
| ------   | ------  | -----------       |
|user_id   |         | foreign_key: true |
|item_id   |         | foreign_key: true|


### Association

- belongs_to: user
- belongs_to: item
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

- has_one   : item
- belongs_to: user
- belongs_to: order
