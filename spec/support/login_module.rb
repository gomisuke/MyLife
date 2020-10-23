module LoginModule
	def login(user)
		visit new_user_session_path
		fill_in 'メールアドレス', with: 'test@example.com'
		fill_in 'パスワード', with: '000000'
		click_button 'ログイン'
	end
end