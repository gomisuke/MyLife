class LivesController < ApplicationController


	def update
		@life = Life.find_by(user_id: current_user)
		@life.update(life_params)
		if @life.save
			flash[:success] = "記録しました"
			redirect_to customs_path
		else
			@customs = Custom.where(user_id: current_user.id)
			@custom_records = CustomRecord.where(user_id: current_user.id)   #ログイン中のユーザーのみのデータを渡す
			render 'customs/index'
		end
	end



	private

		def life_params
			params.require(:life).permit(:study_time, :sleeping_time, :exercise_time, :study_memo, :sleeping_memo, :exercise_memo)
		end
end
