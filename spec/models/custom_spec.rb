require 'rails_helper'

RSpec.describe Custom, type: :model do
  it "ユーザーIDとタスクとタスクステータスがあれば登録できる" do
  	custom = create(:custom)
  	expect(custom).to be_valid
  end

  it "タスクがなければ登録できない" do
  	custom = build(:custom, task: nil)
  	custom.valid?
  	expect(custom.errors[:task]).to include("を入力してください。")
  end

  it "ユーザーIDがなければ登録できない" do
  	custom = build(:custom, user_id: nil)
  	custom.valid?
  	expect(custom.errors[:user_id]).to include("を入力してください。")
  end

  it "タスクステータスがなければ登録できない" do
  	custom = build(:custom, task_status: nil)
  	custom.valid?
  	expect(custom.errors[:task_status]).to include("を入力してください。")
  end
end
