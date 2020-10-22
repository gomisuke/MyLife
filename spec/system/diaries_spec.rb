require 'rails_helper'

RSpec.describe "Diaries", type: :system do
  	describe "日記新規登録機能のテスト" do
  		let!(:genre) {create(:genre)}
  		#let(:user) {create(:user)}

  		before do
  			visit new_user_session_path
  			fill_in 'メールアドレス', with: 'test@example.com'
  			fill_in 'パスワード', with: '000000'
  			click_button 'ログイン'
  		end

  		context "フォーム入力値が正常の場合" do

			it "日記の新規作成が成功する" do
				visit new_diary_path
				fill_in "日付", with: "2020-01-01"
				fill_in 'タイトル', with: "テスト"
				fill_in "内容", with: "日記新規登録機能のテスト"
				select genre.name, from: 'ジャンル'
				choose "絶不調"
				click_button "日記作成"
				expect(page).to have_content "日記を作成しました！"
			end
		end

		context "フォームの入力値が不正の場合" do

			it "日記の新規作成が失敗する" do
			end
		end
	end
end
