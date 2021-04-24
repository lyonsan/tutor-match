FactoryBot.define do
  factory :need do
    association :foreigner
    title { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentence }
    remarks { Faker::Lorem.sentence }
  end
end