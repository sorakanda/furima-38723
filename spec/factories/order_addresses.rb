FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    
    phone_number{'11111111111'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
