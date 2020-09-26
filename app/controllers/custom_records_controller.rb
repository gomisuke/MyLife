class CustomRecordsController < ApplicationController
	before_action :authenticate_user!

	def create
		@custom = Custom.find(params[:id])
		@custom_record = CustomRecord.new
		@custom_record.custom_id = @custom.id
		@custom_record.user = current_user
		@custom_record.start_time = DateTime.now
		if @custom_record.save
			@custom.task_status = 1
			@custom.save
			flash[:success] = "タスク完了！"
			redirect_to customs_path
		else
			render 'customs_index'
		end
	end
end
