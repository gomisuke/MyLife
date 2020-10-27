FactoryBot.define do
	factory :user do
		name {'test_user'}
		acount_name {'@testuser'}
		email {'test@example.com'}
		password {'000000'}
		password_confirmation {'000000'}
		introduction {'testtest'}
	end


end