
FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'000000a'}
    password_confirmation {password}
    last_name             {'テスト'}
    last_name_kana        {'テスト'}
    first_name            {'テスト'}
    first_name_kana       {'テスト'}
    birth                 {'1930/01/01'}
  end
end