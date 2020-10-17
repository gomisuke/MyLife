require 'rails_helper'

RSpec.describe CustomRecord, type: :model do
  it "習慣IDとユーザーIDとカレンダー表示時間があれば登録できる" do
  	custom_record = create(:custom_record)
  	custom_record.valid?
  	expect(custom_record).to be_valid
  end

  it "習慣IDがなければ登録できない" do
  	custom_record = build(:custom_record, user_id: nil)
  	custom_record.valid?
  	expect(custom_record.errors[:user_id]).to include("を入力してください。")
  end

  it "ユーザーIDがなければ登録できない" do
  	custom_record = build(:custom_record, custom_id: nil)
  	custom_record.valid?
  	expect(custom_record.errors[:custom_id]).to include("を入力してください。")
  end

  it "カレンダー表示時間がなければ登録できない" do
  	custom_record = build(:custom_record, start_time: nil)
  	custom_record.valid?
  	expect(custom_record.errors[:start_time]).to include("を入力してください。")
  end
end

