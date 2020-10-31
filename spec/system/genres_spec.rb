require 'rails_helper'

RSpec.describe "Genres", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  describe "ジャンル新規登録のテスト" do
  	let(:user) {create(:user)}
  	before do
  		login(user)
  	end
  	context "フォームの入力値が正常の場合" do
  		it "ジャンル新規登録が成功する" do
  			visit genres_path
  			fill_in "ジャンル名", with: "テスト"
  			click_button "作成"
  			expect(page).to have_content "新しいジャンルを作成しました"
  		end
  	end
  	context "フォームの入力値が不正の場合" do
  		it "ジャンル新規登録が失敗する" do
  			visit genres_path
  			fill_in "ジャンル名", with: ""
  			click_button "作成"
  			expect(page).to have_content "を入力してください。"
  		end
  	end
  end
end
