# テーブル設計

## usersテーブル

 | Column              | Type      | options                        | 
 | --------------------| --------- | ------------------------------ |
 | email               | string    | null: false, unique: true      |
 | encrypted_password  | string    | null: false                    |
 | last_name           | string    | null: false                    |
 | first_name          | string    | null: false                    |
 | last_name           | string    | null: false                    |
 | first_name-kana     | string    | null: false                    |
 | nickname            | string    | null: false                    |
 | birth               | date      | null: false                    |

 ### Association
 
 -has_many :items
 -has_many :orders
 -has_many :addresses

 ## items テーブル

 | Column                 | Type       | Options                        |
 | -------------------    | ---------  | ------------------------------ |
 | name                   | string     | null: false                    |
 | info                   | text       | null: false                    |
 | seller                 | string     | null: false                    |
 | category_id            | integer    | null: false                    |
 | sales_status_id        | integer    | null: false                    |
 | user                   | references | null: false, foreign_key: true |
 | shipping_fee_status__id| integer    | null: false                    |
 | prefecture_id          | integer    | null: false                    |
 | scheduled_delivery_id  | integer    | null: false                    |
 | price                  | integer    | null: false                    |

 ### Association

 -belongs_to :user
 -has_one :order
 -has_one :address

 ## orders

 | Column              | Type      | options                        |
 | --------------------| --------- | -------------------------------|
 | users               | references| null: false, foreign_key: true |
 | items               | references| null: false, foreign_key: true |

 ### Association

 -belongs_to :user
 -belongs_to :item
 -belongs_to :address

 ## addresses

 | Column              | Type      | options                        | 
 | --------------------| --------- | ------------------------------ |
 | post_code           | integer   | null: false                    |
 | prefecture_id       | integer   | null: false                    |
 | city                | string    | null: false                    |
 | house_number        | integer   | null: false                    |
 | building_name       | string    |                                |
 | phone_number        | integer   | null: false                    |

 ### Association

 -belongs_to :user
 -belongs_to :item
 -belongs_to :order
