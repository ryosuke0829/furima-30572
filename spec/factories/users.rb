FactoryBot.define do
  factory :user do
    nickname              { 'ヤマ' }
    email                 { 'aaaa@gmail.com' }
    password              { '0000aaa' }
    password_confirmation { '0000aaa' }
    first_name            { '隆太郎' }
    last_name             { '山田' }
    first_name_kana            { 'リクタロウ' }
    last_name_kana             { 'ヤマダ' }
    birth_date { '2000/01/01' }
  end
end
