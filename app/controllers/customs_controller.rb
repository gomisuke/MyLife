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
		custom.save
		redirect_to customs_path
	end

	def destroy
		@custom = Custom.find(params[:id])
		@custom.destroy
		redirect_to customs_management_path
	end




	private
		def custom_params
			params.require(:custom).permit(:task)
		end


end
