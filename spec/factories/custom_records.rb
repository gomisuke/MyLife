FactoryBot.define do
  factory :custom_record do
    association :custom
    user {custom.user}
    start_time {"2020-01-01"}
  end
end
