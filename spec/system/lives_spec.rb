require 'rails_helper'

RSpec.describe "Lives", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end

  describe "生活記録のテスト" do
  	let(:user) {create(:user)}
  	before do
  		login(user)
  	end
  	it "生活記録が更新される" do
  		visit customs_path
  		fill_in "勉強時間", with: 100
  		click_button "記録"
  		expect(page).to have_content "記録しました"
  	end
  end
end
