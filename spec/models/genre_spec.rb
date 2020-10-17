require 'rails_helper'

RSpec.describe Genre, type: :model do
  it "ユーザーIDとジャンル名があれば登録できる" do
  	genre = create(:genre)
  	expect(genre).to be_valid
  end

  it "ユーザーIDがなければ登録できない" do
  	genre = build(:genre, user_id: nil)
  	genre.valid?
  	expect(genre.errors[:user_id]).to include("を入力してください。")
  end

  it "ジャンル名がなければ登録できない" do
  	genre = build(:genre, name: nil)
  	genre.valid?
  	expect(genre.errors[:name]).to include("を入力してください。")
  end
end
