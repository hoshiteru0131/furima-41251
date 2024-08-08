FactoryBot.define do
  factory :user do
    nickname              { 'testuser' }
    email                 { Faker::Internet.unique.email }
    password              { '1111qqqq' }
    password_confirmation { '1111qqqq' }
    last_name_kanji       { '山田' }
    first_name_kanji      { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_date            { '2000-01-01' }
  end
end
