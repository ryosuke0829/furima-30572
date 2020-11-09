FactoryBot.define do
  factory :user_order do
    postal_code { '111-1111' }
    prefecture_id { '2' }
    city { '市' }
    street_number { '番地' }
    building_name { 'ビル' }
    phone_number { '09011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
