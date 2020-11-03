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

  it "ジャンル名が15文字以内でないと登録できない" do
    genre = build(:genre, name: "a" * 16)
    genre.valid?
    expect(genre.errors[:name]).to include("は15文字以内で入力してください。")
  end

end
