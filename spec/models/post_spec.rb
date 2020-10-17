require 'rails_helper'

RSpec.describe Post, type: :model do
	it "ユーザーIDと投稿内容と投稿写真と公開設定があれば登録できる" do
	    post = create(:post)
	    post.valid?
	    expect(post).to be_valid
	end

	it "ユーザーIDがなければ登録できない" do
		post = build(:post, user_id: nil)
		post.valid?
		expect(post.errors[:user_id]).to include("を入力してください。")
	end

	it "投稿内容がなければ登録されない" do
		post = build(:post, content: nil)
		post.valid?
		expect(post.errors[:content]).to include("を入力してください。")
	end

	it "投稿写真がなければ登録できない" do
		post = build(:post, post_image: nil)
		post.valid?
		expect(post.errors[:post_image]).to include("を入力してください。")
	end


end
