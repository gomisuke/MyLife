FactoryBot.define do
  factory :custom do
    task {'テスト'}
    task_status {'未達成'}
    association :user
  end
end
