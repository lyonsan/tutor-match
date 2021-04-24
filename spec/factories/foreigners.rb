FactoryBot.define do
  factory :foreigner do
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { password }
    name                  { Faker::Name.initials(number: 2) }
    gender                { Faker::Gender.binary_type }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
    country_region        { Faker::Nation.nationality }
    language              { Faker::Nation.nationality }
    japanese_level_id     { Faker::Number.between(from: 2, to: 6) }
    address               { Faker::Address.city }
    job                   { Faker::Job.title }
    hobby                 { Faker::Lorem.sentence }
    concern               { 'concern' }
    welcome               { Faker::Lorem.sentence }
    free                  { Faker::Lorem.sentence }
  end
end
