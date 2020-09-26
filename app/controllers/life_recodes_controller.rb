class LifeRecodesController < ApplicationController
	before_action :authenticate_user!

	def index
		@life_recodes = current_user.life_recodes.order(created_at: "DESC")
	end
end
