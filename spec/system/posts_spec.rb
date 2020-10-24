require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "新規投稿機能のテスト" do
  	let!(:user) {create(:user)}
  	before do
  		login(:user)
  	end

  	context "フォームの入力値が正常の場合" do

  		it "新規投稿が成功する" do
  			visit new_post_path
  			fill_in "投稿内容", with: "テスト"
  			fill_in "タグ付け", with: "テスト"
  			#attach_file "投稿写真", "#{Rails.root}/spec/fixtures/test.png"
  			click_button "投稿"
  			expect(page).to have_content "テスト"
  		end
  	end
  end
end