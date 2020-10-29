require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "新規登録機能のテスト" do

  	context "フォーム入力値が正常の場合" do

  		it "新規登録に成功する" do
  			visit root_path
  			click_link "signup-btn"
  			fill_in "ユーザー名", with: "テストユーザー"
  			fill_in "アカウント名", with: "@test_user"
  			fill_in "一言文", with: "テスト"
  			fill_in "メールアドレス", with: "test@example.com"
  			fill_in "パスワード", with: "testtest"
  			fill_in "確認用パスワード", with: "testtest"
  			attach_file "profile-image", "#{Rails.root}/spec/fixtures/test.png"
  			click_button "新規登録"
  			expect(page).to have_content "アカウント登録が完了しました"
  		end
  	end

  	context "フォームの値が不正の場合" do

  		it "新規登録に失敗する" do
  			visit root_path
  			click_link "signup-btn"
  			fill_in "ユーザー名", with: ""
  			fill_in "アカウント名", with: "@test_user"
  			fill_in "一言文", with: "テスト"
  			fill_in "メールアドレス", with: "test@example.com"
  			fill_in "パスワード", with: "testtest"
  			fill_in "確認用パスワード", with: "testtest"
  			attach_file "profile-image", "#{Rails.root}/spec/fixtures/test.png"
  			click_button "新規登録"
  			expect(page).to have_content "を入力してください"
  		end

  	end
  end

  describe "ログイン機能のテスト" do
  	let!(:user) {create(:user)}

  	context "会員情報が存在する場合" do

  		it "ログインに成功する" do
  			visit root_path
  			click_link "sigin-btn"
  			fill_in "メールアドレス", with: "test@example.com"
  			fill_in "パスワード", with: "000000"
  			click_button "ログイン"
  			expect(page).to have_content "ログインしました"
  		end
  	end

  	context "会員情報が存在しない場合" do

  		it "ログインに失敗する" do
  			visit root_path
  			click_link "sigin-btn"
  			fill_in "メールアドレス", with: "not-exist@example.com"
  			fill_in "パスワード", with: "000000"
  			click_button "ログイン"
  			expect(page).to have_content "メールアドレスまたはパスワードが違います。"
  		end
  	end
  end

  describe "会員情報編集機能のテスト" do
  	let(:user) {create(:user)}
  	before do
  		login(user)
  	end
  	it "会員情報編集ができる" do
  		visit edit_user_registration_path(user.id)
  		fill_in "一言文", with: "編集テスト"
  		click_button "登録情報を更新する"
  		expect(page).to have_content "アカウント情報を変更しました"
  	end
  end

end
