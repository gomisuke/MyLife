require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "タグ名があれば登録できる" do
  	tag = create(:tag)
  	tag.valid?
  	expect(tag).to be_valid
  end

  it "タグ名がなければ登録できない" do
  	tag = build(:tag, name: nil)
  	tag.valid?
  	expect(tag.errors[:name]).to include("を入力してください。")
  end
 
end
