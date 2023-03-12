class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :house_number
    validates :city
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: 'is invalid.'}
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    


  def save
    # 購入記録を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number:phone_number, order_id: order.id)
  end
end 