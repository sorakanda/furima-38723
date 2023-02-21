# テーブル設計

## user　テーブル

 | Column              | Type      | options                        |
 | --------------------| --------- | ------------------------------ |
 | email               | string    | null: false, unique: true      |
 | encrypted_password  | string    | null: false                    |
 | name                | string    | null: false                    |
 | name-kana           | string    | null: false                    |
 | nickname            | string    | null: false                    |
 | birth               | string    | null: false                    |

 ### Association
 
 - has_many :items

 ## items テーブル

 | Column              | Type      | Options                        |
 | ------------------- | --------- | ------------------------------ |
 | name                | string    | null: false                    |
 | info                | text      | null: false                    |
 | categoy             | text      | null: false                    |
 | user                | references| null: false, foreign_key: true |
 | shipping-fee-status | string    | null: false                    |
 | prefecture          | string    | null: false                    |
 | scheduled-delivery  | string    | null: false                    |
 | price               | string    | null: false                    |

 ### Association

 -belong_to :user