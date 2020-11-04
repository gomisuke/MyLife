class LifeRecodesController < ApplicationController
	before_action :authenticate_user!

	def index
		@life_recodes = current_user.life_recodes.order(created_at: "DESC")
	end

	def edit
		@life_recode = LifeRecode.find(params[:id])
	end

	def update
		@life_recode = LifeRecode.find(params[:id])
		@life_recode.update(life_recode_params)
		redirect_to life_recodes_path
	end

	private

		def life_recode_params
			params.require(:life_recode).permit(:study_time, :sleeping_time, :exercise_time, :study_memo, :sleeping_memo, :exercise_memo)
		end
end
