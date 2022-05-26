FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { "1a" + Faker::Internet.password(min_length: 6, mix_case: false, special_characters: false) }
    password_confirmation { password }

    japanese_user = Gimei.name

    last_name { japanese_user.last.kanji }
    last_name_kana { japanese_user.last.katakana }
    first_name { japanese_user.first.kanji }
    first_name_kana { japanese_user.first.katakana }

    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
