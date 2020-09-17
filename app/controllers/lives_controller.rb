class LivesController < ApplicationController


	def update
		@life = Life.find_by(user_id: current_user)
		@life.update(life_params)
		binding.pry
		@life.save
		redirect_to customs_path
	end



	private

		def life_params
			params.require(:life).permit(:study_time, :sleeping_time, :exercise_time, :study_memo, :sleeping_memo, :exercise_memo)
		end
end
