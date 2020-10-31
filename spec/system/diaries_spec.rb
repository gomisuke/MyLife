require 'rails_helper'

RSpec.describe "Diaries", type: :system do

  	describe "日記新規登録機能のテスト" do
  		let!(:genre) {create(:genre)}
  		before do
  			login(genre.user)
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
				#byebug
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
	describe "一覧ページのテスト" do
		let!(:user_a) {create(:user, name: "ユーザーA", email: "a@example.com", acount_name: "@test_user1")}
		let!(:user_b) {create(:user, name: "ユーザーB", email: "b@example.com", acount_name: "@test_user2")}
		let(:genre_a) {create(:genre, user: user_a)}
		let(:genre_b) {create(:genre, user: user_b)}
		before do
			create(:diary, title: "日記A", genre: genre_a)
			create(:diary, title: "日記B", genre: genre_b)
		end
		describe "ログインユーザーの投稿のみが表示される" do
			context "ユーザーAがログインしている場合" do
				before do
					login(user_a)
				end
				it "ユーザーAの日記のみが表示される" do
					visit diaries_path
					expect(page).to have_content "日記A"
				end
				it "ユーザーA以外の日記が表示されない" do
					visit diaries_path
					expect(page).not_to have_content "日記B"
				end
			end
			context "ユーザーBがログインしている場合" do
				before do
					login(user_b)
				end
				it "ユーザーBの日記のみが表示される" do
					visit diaries_path
					expect(page).to have_content "日記B"
				end
				it "ユーザーB以外のニキが表示されない" do
					visit diaries_path
					expect(page).not_to have_content "日記A"
				end
			end
		end
		describe "表示のテスト" do
			before do
				login(user_a)
				visit diaries_path
			end
			it "タイトルが表示される" do
				expect(page).to have_content "日記A"
			end
			it "日記内容が表示される" do
				expect(page).to have_content "testtest"
			end
			it "日記投稿日時が表示される" do
				expect(page).to have_content "2020年01月01日"
			end
		end
	end
	describe "詳細ページのテスト" do
		let(:diary) {create(:diary)}

		before do
			login(diary.user)
		end
		it "タイトルが表示される" do
			visit diary_path(diary.id)
			expect(page).to have_content diary.title
		end
		it "日記内容が表示される" do
			visit diary_path(diary.id)
			expect(page).to have_content diary.body
		end
		it "日記投稿日時が表示される" do
			visit diary_path(diary.id)
			expect(page).to have_content diary.diary_date.strftime("%Y年%m月%d日")
		end
	end
end
