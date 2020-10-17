require 'rails_helper'

RSpec.describe Diary, type: :model do
  it "ユーザーIDとジャンルIDとタイトルと内容と日付と充実度がある時登録される" do
  	diary = create(:diary)
  	diary.valid?
  	expect(diary).to be_valid
  end

  it "ユーザーIDがなければ登録されない" do
  	diary = build(:diary, user_id: nil)
  	diary.valid?
  	expect(diary.errors[:user_id]).to include("を入力してください。")
  end

  it "ジャンルIDがなければ登録されない" do
  	diary = build(:diary, genre_id: nil)
  	diary.valid?
  	expect(diary.errors[:genre_id]).to include("を入力してください。")
  end

  it "タイトルがなければ登録されない" do
  	diary = build(:diary, title: nil)
  	diary.valid?
  	expect(diary.errors[:title]).to include("を入力してください。")
  end

  it "内容がなければ登録されない" do
  	diary = build(:diary, body: nil)
  	diary.valid?
  	expect(diary.errors[:body]).to include("を入力してください。")
  end

  it "日付がなければ登録されない" do
  	diary = build(:diary, diary_date: nil)
  	diary.valid?
  	expect(diary.errors[:diary_date]).to include("を入力してください。")
  end

  it "充実度がなければ登録されない" do
  	diary = build(:diary, adequacy: nil)
  	diary.valid?
  	expect(diary.errors[:adequacy]).to include("を入力してください。")
  end
end
