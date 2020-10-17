require 'rails_helper'

RSpec.describe Life, type: :model do
  it "ユーザーIDと勉強時間と睡眠時間と運動時間があれば登録できる" do
  	life = create(:life)
  	life.valid?
  	expect(life).to be_valid
  end

  it "ユーザーIDがなければ登録できない" do
  	life = build(:life, user_id: nil)
  	life.valid?
  	expect(life.errors[:user_id]).to include("を入力してください。")
  end

  it "勉強時間がなければ登録できない" do
  	life = build(:life, study_time: nil)
  	life.valid?
  	expect(life.errors[:study_time]).to include("を入力してください。")
  end

  it "睡眠時間がなければ登録できない" do
  	life = build(:life, sleeping_time: nil)
  	life.valid?
  	expect(life.errors[:sleeping_time]).to include("を入力してください。")
  end

  it "運動時間がなければ登録できない" do
  	life = build(:life, exercise_time: nil)
  	life.valid?
  	expect(life.errors[:exercise_time]).to include("を入力してください。")
  end
  
end
