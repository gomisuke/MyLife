class LifeRecodesController < ApplicationController

	def index
		@life_recodes = LifeRecode.where(user_id: current_user.id)
	end
end
