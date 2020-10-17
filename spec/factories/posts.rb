FactoryBot.define do
  factory :post do
    association :user
    content {"test"}
    post_image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png'))}
    post_status {true}
  end
end
