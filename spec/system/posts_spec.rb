require 'rails_helper'

RSpec.describe "Posts", type: :system do

  describe "新規投稿機能のテスト" do
  	let!(:user) {create(:user)}
  	before do
  		login(user)
  	end
  	context "新規投稿に成功した場合" do
      before do
        visit new_post_path
        fill_in "投稿内容", with: "テスト"
        fill_in "タグ付け", with: "テスト"
        attach_file "post-image", "#{Rails.root}/spec/fixtures/test.png"
        click_button "投稿"
      end
  		it "サクセスメッセージが表示される" do
  			expect(page).to have_content "投稿しました"
  		end
      it "投稿一覧ページに遷移する" do
        expect(page).to have_content "投稿一覧"
      end
    end
  	context "新規投稿に失敗した場合" do
      before do
        visit new_post_path
        fill_in "投稿内容", with: "テスト"
        fill_in "タグ付け", with: "テスト"
        attach_file "post-image", nil
        click_button "投稿"
      end
  		it "エラーメッセージが表示される" do
  			expect(page).to have_content "を入力してください"
  		end
      it "新規投稿ページに遷移する" do
        expect(page).to have_content "投稿する"
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
    it "いいねを外す", js: true do
      visit posts_path
      click_link "not-like-btn"
      click_link "like-btn"
      expect(find('#like-off')).to be_visible
    end
  end

  describe "投稿詳細ページのテスト" do
    let!(:post) {create(:post)}
    before do
      login(post.user)
    end
    context "ログインユーザーの投稿の場合" do
      it "削除ボタンが表示される" do
        visit post_path(post)
        expect(page).to have_link "削除"
      end
    end
    context "ログインユーザー以外の投稿の場合" do
      let(:user2) {create(:user, name:"user2", acount_name:"@test_user2", email: "user2@example.com")}
      let(:post2) {create(:post, user: user2)}
      it "削除ボタンは表示されない" do
        visit post_path(post2)
        expect(page).not_to have_link "削除"
      end
    end
  end

end
