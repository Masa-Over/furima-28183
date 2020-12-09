FactoryBot.define do
  factory :item do
    name            {"item"}
    explanation     {"good"}
    price           {300}
    category_id     {2}
    status_id       {2}
    delivery_fee_id {2}
    prefecture_id   {2}
    send_day_id     {2}
    association :user

  end
end
