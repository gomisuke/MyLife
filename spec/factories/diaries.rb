FactoryBot.define do
  factory :diary do
    association :genre
    user {genre.user}
    title {"test"}
    body {"testtest"}
    diary_date {"2020-01-01"}
    adequacy {1}
  end

end
