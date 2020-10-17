require 'rails_helper'

RSpec.describe LifeRecode, type: :model do
  it "ユーザーIDと勉強時間と睡眠時間と運動時間と記録日があれば登録できる" do
  	life_recode = create(:life_recode)
  	life_recode.valid?
  	expect(life_recode).to be_valid
  end

  it "ユーザーIDがなければ登録できない" do
  	life_recode = build(:life_recode, user_id: nil)
  	life_recode.valid?
  	expect(life_recode.errors[:user_id]).to include("を入力してください。")
  end

  it "勉強時間がなければ登録できない" do
  	life_recode = build(:life_recode, study_time: nil)
  	life_recode.valid?
  	expect(life_recode.errors[:study_time]).to include("を入力してください。")
  end

  it "睡眠時間がなければ登録できない" do
  	life_recode = build(:life_recode, sleeping_time: nil)
  	life_recode.valid?
  	expect(life_recode.errors[:sleeping_time]).to include("を入力してください。")
  end

  it "運動時間がなければ登録できない" do
  	life_recode = build(:life_recode, exercise_time: nil)
  	life_recode.valid?
  	expect(life_recode.errors[:exercise_time]).to include("を入力してください。")
  end

  it "記録日がなければ登録できない" do
  	life_recode = build(:life_recode, life_date: nil)
  	life_recode.valid?
  	expect(life_recode.errors[:life_date]).to include("を入力してください。")
  end
end
