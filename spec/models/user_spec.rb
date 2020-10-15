require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前とアカウント名とメールアドレスとパスワードがあれば登録できる" do
  	user = create(:user)
  	expect(user).to be_valid
  end

  it "名前がなければ登録できない" do
  	user = build(:user, name: nil)
  	user.valid?
  	expect(user.errors[:name]).to include("を入力してください。", "は2文字以上で入力してください。")
  end

end
