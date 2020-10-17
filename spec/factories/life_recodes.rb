FactoryBot.define do
  factory :life_recode do
    association :user
    study_time {100}
    sleeping_time {100}
    exercise_time {100}
    study_memo {"test"}
    sleeping_memo {"test"}
    exercise_memo {"test"}
    life_date {"2020-01-01"}
  end
end
