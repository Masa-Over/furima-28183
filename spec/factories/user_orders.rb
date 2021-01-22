FactoryBot.define do
  factory :user_order do
    prefecture_id {2}
    municipalities {'横浜市緑区'}
    address {'青山1-1-1'}
    postal_code {'123-4567'}
    phone_number{'09012345678'}
    building {'柳ビル'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
