class CustomsController < ApplicationController


	def index
		@customs = Custom.where(user_id: current_user.id)
		@custom_records = CustomRecord.where(user_id: current_user.id)   #ログイン中のユーザーのみのデータを渡す
		@life = Life.find_or_create_by(user_id: current_user.id)
	end

	def management
		@custom = Custom.new
		@customs = Custom.where(user_id: current_user.id)
	end

	def create
		custom = Custom.new(custom_params)
		custom.user = current_user
		if custom.save
			flash[:success] = "新しい習慣を追加しました！今日から続けよう！"
			redirect_to customs_path
		else
			render 'management'
		end
	end

	def destroy
		@custom = Custom.find(params[:id])
		if @custom.destroy
			flash[:danger] = "習慣を削除しました"
			redirect_to customs_management_path
		else
			render 'management'
		end
	end




	private
		def custom_params
			params.require(:custom).permit(:task)
		end


end
