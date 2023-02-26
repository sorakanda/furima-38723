FactoryBot.define do
  factory :item do
    name                     {'test'}
    info                     {'test'}
    category_id              {'2'}
    sales_status_id          {'2'}
    shipping_fee_status_id   {'2'}
    prefecture_id            {'2'}
    scheduled_delivery_id    {'2'}
    price                    {'300'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima-header01.png'), filename: 'furima-header01.png')
    end
  end
end
