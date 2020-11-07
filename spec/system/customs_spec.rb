require 'rails_helper'

RSpec.describe "Customs", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  let!(:user) {create(:user)}
  before do
    login(user)
  end
  describe "習慣タスクの新規登録" do
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
  describe "習慣設定のテスト" do
    context "登録タスクが０個の場合" do
      it "タスクを設定しようの表示が出る" do
        visit customs_path
        expect(page).to have_content "タスクを設定しよう"
      end
    end
    context "登録タスクが全て達成済みの場合" do
      let!(:custom) {create(:custom, user: user)}
      it "チェックマークが表示される" do
        visit customs_path
        click_link "task_button"
        expect(find('#complete-image')).to be_visible
      end
    end
  end

end
