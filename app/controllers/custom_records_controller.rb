class CustomRecordsController < ApplicationController

	def create
		@custom = Custom.find(params[:id])
		@custom.task_status = 1
		@custom.save
		@custom_record = CustomRecord.new
		@custom_record.custom_id = @custom.id
		@custom_record.user = current_user
		@custom_record.start_time = DateTime.now
		@custom_record.save
		redirect_to customs_path
	end
end
