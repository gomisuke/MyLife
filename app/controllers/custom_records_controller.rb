class CustomRecordsController < ApplicationController

	def create
		@custom_record = CustomRecord.new
		@custom_record.custom_id = params[:id]
		@custom_record.start_time = DateTime.now
		@custom_record.save
		redirect_to customs_path
	end
end
