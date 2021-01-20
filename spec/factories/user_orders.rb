FactoryBot.define do
  factory :user_order do
    prefecture_id {2}
    municipalities {'横浜市緑区'}
    address {'青山1-1-1'}
    postal_code {'123-4567'}
    phone_number{'09012345678'}
    item_id{1}
    user_id{1}
    token {"tok_abcdefghijk00000000000000000"}

  end
end

#:prefecture_id, :municipalities, :address, :postal_code, :phone_number, :building, :user_id, :item_id