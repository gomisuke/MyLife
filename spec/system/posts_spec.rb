require 'rails_helper'

RSpec.describe "Posts", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  describe "新規投稿機能のテスト" do
  	let!(:user) {create(:user)}
  	before do
  		login(user)
  	end
  	context "フォームの入力値が正常の場合" do
  		it "ページ遷移が正常" do
  			
  		end
  		it "新規投稿が成功する" do
  			visit new_post_path
  			fill_in "投稿内容", with: "テスト"
  			fill_in "タグ付け", with: "テスト"
  			attach_file "post-image", "#{Rails.root}/spec/fixtures/test.png"
  			click_button "投稿"
  			expect(page).to have_content "テスト"
  		end
  	end
  	context "フォームの値が不正の場合" do
  		it "新規投稿が失敗する" do
  			visit new_post_path
  			fill_in "投稿内容", with: "テスト"
  			fill_in "タグ付け", with: "テスト"
  			attach_file "post-image", nil
  			click_button "投稿"
  			expect(page).to have_content "を入力してください"
  		end
  	end
  end
  describe "いいね機能のテスト" do
  	let!(:post) {create(:post)}
  	before do
  		login(post.user)
  	end
  	it "いいねをする", js: true do
  		visit posts_path
  		click_link "not-like-btn"
  		expect(find('#like-on')).to be_visible
  	end
  end
end
