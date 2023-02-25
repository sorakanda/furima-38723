
FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000a'}
    password_confirmation {password}
    last_name             {'テスト'}
    last_name_kana        {'テスト'}
    first_name            {'テスト'}
    first_name_kana       {'テスト'}
    birth                 {'1930/01/01'}
  end
end