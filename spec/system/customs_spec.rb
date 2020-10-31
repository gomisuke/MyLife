require 'rails_helper'

RSpec.describe "Customs", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end

  describe "習慣タスクの新規登録" do
  	let!(:user) {create(:user)}
  	before do
  		login(user)
  	end
  	context "フォーム入力値が正常の場合" do
  		it "新規タスク登録が成功する" do
  			visit customs_management_path
  			fill_in "新しい習慣を作る", with: "テスト"
  			click_button "作成"
  			expect(page).to have_content "テスト"
  		end
  	end
  	context "フォームの入力値が不正の場合" do
  		it "新規タスク登録が失敗する" do
  			visit customs_management_path
  			fill_in "新しい習慣を作る", with: ""
  			click_button "作成"
  			expect(page).to have_content "を入力してください"
  		end
  	end
  end
end
