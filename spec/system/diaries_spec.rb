require 'rails_helper'

RSpec.describe "Diaries", type: :system do
  	describe "日記新規登録機能のテスト" do
  		let!(:genre) {create(:genre)}

  		before do
  			login(:user)
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
				visit new_diary_path
				fill_in "日付", with: "2020-01-01"
				fill_in 'タイトル', with: ""
				fill_in "内容", with: "日記新規登録機能のテスト"
				select genre.name, from: 'ジャンル'
				choose "絶不調"
				click_button "日記作成"
				expect(page).to have_content "を入力してください"
			end
		end
	end

	describe "日記一覧表示のテスト" do
		let!(:diary) {create(:diary)}

		before do
			login(:user)
		end

		it "ログインユーザーの投稿日記のみが表示される" do
			visit diaries_path
			
		end

	end
end
