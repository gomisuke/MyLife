class CustomsController < ApplicationController


	def index
		@customs = Custom.all
		@custom_records = CustomRecord.all
	end

	def management
		@custom = Custom.new
		@customs = Custom.all
	end

	def create
		custom = Custom.new(custom_params)
		custom.user = current_user
		custom.save
		redirect_to customs_path
	end




	private


		def custom_params
			params.require(:custom).permit(:task)
		end
end
