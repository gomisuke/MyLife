class InquiryMailer < ApplicationMailer

	def send_mail(inquiry)

		@inquiry = inquiry
	 	mail(
	 		from:  'system@example.com',
	  		to:   ENV['INQUIRY_MAIL'],
	   		subject: "お問い合わせ"
	 	)
	end

end
