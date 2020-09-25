class InquiriesController < ApplicationController

	def new
		@inquiry = Inquiry.new
	end

	def create
		@inquiry = Inquiry.create(inquiry_params)
		if @inquiry.save
			InquiryMailer.send_mail(@inquiry).deliver
		end
		redirect_to customs_path
	end


	private

		def inquiry_params
			params.require(:inquiry).permit(:name, :mail, :message)
		end
end
