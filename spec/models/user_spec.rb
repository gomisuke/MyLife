require 'rails_helper'

RSpec.describe User, type: :model do
	# let(:user) { create(:user) }

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

  it "アカウント名がなければ登録できない" do
  	user = build(:user, acount_name: nil)
  	user.valid?
  	expect(user.errors[:acount_name]).to include("を入力してください。", "は不正な値です。")
  end

  it "一言文がなければ登録できない" do
  	user = build(:user, introduction: nil)
  	user.valid?
  	expect(user.errors[:introduction]).to include("を入力してください。")
  end

end
