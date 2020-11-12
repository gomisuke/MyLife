require 'rails_helper'

RSpec.describe "Users", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  describe "新規登録機能のテスト" do
  	context "新規登録に成功した場合" do
      before do
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
      end
  		it "登録完了メッセージが表示される" do
  			expect(page).to have_content "アカウント登録が完了しました"
  		end
      it "ホーム画面に遷移する" do
        expect(find('#home-image')).to be_visible
      end
  	end
  	context "新規登録に失敗した場合" do
      before do
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
      end
  		it "エラーメッセージが表示される" do
  			expect(page).to have_content "を入力してください"
  		end
      it "新規登録画面に遷移する" do
        expect(page).to have_content "新規登録画面"
      end
  	end
  end

  describe "ログイン機能のテスト" do
  	let!(:user) {create(:user)}
  	context "会員情報が存在しログインに成功した場合" do
      before do
        visit root_path
        click_link "sigin-btn"
        fill_in "メールアドレス", with: "test@example.com"
        fill_in "パスワード", with: "000000"
        click_button "ログイン"
      end
  		it "ログイン完了メッセージが表示される" do
  			expect(page).to have_content "ログインしました"
  		end
      it "ホームページに遷移する" do
        expect(find('#home-image')).to be_visible
      end
  	end
  	context "会員情報が存在しない場合" do
      before do
        visit root_path
        click_link "sigin-btn"
        fill_in "メールアドレス", with: "not-exist@example.com"
        fill_in "パスワード", with: "000000"
        click_button "ログイン"
      end
  		it "エラーメッセージが表示される" do
  			expect(page).to have_content "メールアドレスまたはパスワードが違います。"
  		end
      it "ログイン画面に遷移する" do
        expect(page).to have_content "ログイン画面"
      end
  	end
  end

  describe "会員情報編集機能のテスト" do
  	let(:user) {create(:user)}
  	before do
  		login(user)
  	end
    context "編集内容が更新される" do
      before do
        visit edit_user_registration_path(user.id)
        fill_in "一言文", with: "編集テスト"
        click_button "登録情報を更新する"
      end
    	it "更新メッセージが表示される" do
    		expect(page).to have_content "アカウント情報を変更しました"
    	end
      it "マイページに遷移する" do
        expect(page).to have_content "マイページ"
      end
    end
  end

  describe "サンプルユーザーのテスト" do
    let!(:user) {create(:user, email: "test_user@example.com")}
    before do
      visit root_path
      click_link "test-signin-btn"
    end
    describe "簡単ログインのテスト" do
      it "ログインメッセージが表示される" do
        expect(page).to have_content "サンプルユーザーとしてログインしました。"
      end
      it "ホームページに遷移する" do
        expect(find('#home-image')).to be_visible
      end
    end
    describe "サンプルユーザー編集機能のテスト" do
      it "サンプルユーザーは会員情報を編集できない" do
        visit edit_user_registration_path
        click_button "登録情報を更新する"
        expect(page).to have_content "サンプルユーザーは変更できません。"
      end
    end
  end
end
