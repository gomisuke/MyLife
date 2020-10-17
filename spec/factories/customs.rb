FactoryBot.define do
  factory :custom do
    task {'テスト'}
    task_status {'達成'}
    association :user
  end
end
