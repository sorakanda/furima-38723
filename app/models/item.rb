class Item < ApplicationRecord
  belongs_to :user
  # has_one    :order  この後の実装のためコメントアウト
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category # :sales_status, :shipping_fee_status, :prrefecture, :Scheduled_delivery

  validates :name,                  presence: true
  validates :info,                  presence: true
  validates :price,                                                                            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
  validates :category_id, :sales_status_id, :shipping_fee_status_id, :scheduled_delivery_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,                                                                    numericality: { other_than: 0 , message: "can't be blank"}
end