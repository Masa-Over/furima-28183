FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"test@example"}
    password              {"000aaa"}
    password_confirmation {password}
    familyname            {"あべ"}
    firstname             {"しんぞう"}
    familyname_katakana   {"アベ"}
    firstname_katakana    {"シンゾウ"}
    birthday              {Date.today}
  end
end