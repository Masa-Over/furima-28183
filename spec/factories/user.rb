FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"000aaa"}
    password_confirmation {password}
    familyname            {"あべ"}
    firstname             {"しんぞう"}
    familyname_katakana   {"アベ"}
    firstname_katakana    {"シンゾウ"}
    birthday              {Date.today}
  end
end