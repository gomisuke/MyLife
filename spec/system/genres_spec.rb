require 'rails_helper'

RSpec.describe "Genres", type: :system do

  describe "ジャンル新規登録のテスト" do
  	let(:user) {create(:user)}
  	before do
  		login(user)
  	end
  	context "新規登録に成功した場合" do
      before do
        visit genres_path
        fill_in "ジャンル名", with: "テスト"
        click_button "作成"
      end
  		it "サクセスメッセージが表示される" do
  			expect(page).to have_content "新しいジャンルを作成しました"
  		end
      it "ジャンル一覧ページに遷移する" do
        expect(page).to have_content "ジャンル一覧"
      end
      it "日記投稿時のセレクトボックスに表示される" do
        visit new_diary_path
        expect(page).to have_select("ジャンル", options: ["選択して下さい","テスト"])
      end
  	end
  	context "新規登録に失敗した場合" do
      before do
        visit genres_path
        fill_in "ジャンル名", with: ""
        click_button "作成"
      end
  		it "エラーメッセージが表示される" do
  			expect(page).to have_content "を入力してください。"
  		end
      it "ジャンル一覧ページに遷移する" do
        expect(page).to have_content "ジャンル一覧"
      end
  	end
  end

end
