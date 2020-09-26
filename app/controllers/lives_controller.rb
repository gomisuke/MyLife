class LivesController < ApplicationController
	before_action :authenticate_user!

	def update
		@life = current_user.life
		@life.update(life_params)
		if @life.save
			flash[:success] = "記録しました"
			redirect_to customs_path
		else
			@customs = current_user.customs
			@custom_records = current_user.custom_records
			render 'customs/index'
		end
	end

	private

		def life_params
			params.require(:life).permit(:study_time, :sleeping_time, :exercise_time, :study_memo, :sleeping_memo, :exercise_memo)
		end
end
