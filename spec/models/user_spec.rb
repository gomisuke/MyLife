require 'rails_helper'

RSpec.describe User, type: :model do
	describe "バリデーションのテスト" do

    it "名前とアカウント名とメールアドレスとパスワードがあれば登録できる" do
    	user = build(:user)
    	user.valid?
    	expect(user).to be_valid
    end

    it "名前がなければ登録できない" do
    	user = build(:user, name: nil)
    	user.valid?
    	expect(user.errors[:name]).to include("を入力してください。", "は2文字以上で入力してください。")
    end

    it "名前が2文字以上でないと登録できない" do
      user = build(:user, name: "a")
      user.valid?
      expect(user.errors[:name]).to include("は2文字以上で入力してください。")
    end

    it "名前が10文字以下でないと登録できない" do
      user = build(:user, name: "a" * 11)
      user.valid?
      expect(user.errors[:name]).to include("は10文字以内で入力してください。")
    end

    it "アカウント名がなければ登録できない" do
    	user = build(:user, acount_name: nil)
    	user.valid?
    	expect(user.errors[:acount_name]).to include("を入力してください。", "は不正な値です。")
    end

    it "アカウント名が指定の表記でないと登録できない" do
      user = build(:user, acount_name: "testtest")
      user.valid?
      expect(user.errors[:acount_name]).to include("は不正な値です。")
    end

    it "一言文がなければ登録できない" do
    	user = build(:user, introduction: nil)
    	user.valid?
    	expect(user.errors[:introduction]).to include("を入力してください。")
    end

    it "一言文が100文字以下でないと登録できない" do
      user = build(:user, introduction: "a" * 101)
      user.valid?
      expect(user.errors[:introduction]).to include("は100文字以内で入力してください。")
    end


  end

end
