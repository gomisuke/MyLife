FactoryBot.define do
  factory :genre do
    association :user
    name {"test"}
  end
end
