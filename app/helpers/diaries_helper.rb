module DiariesHelper


	def adequacy_status(diary)
		case diary.adequacy
			when 1
				image_tag asset_path('nicochan5.png'), class:"diary-image-mypage"
			when 2
				image_tag asset_path('nicochan4.png'), class:"diary-image-mypage"
			when 3
				image_tag asset_path('nicochan1.png'), class:"diary-image-mypage"
			when 4
				image_tag asset_path('nicochan2.png'), class:"diary-image-mypage"
			when 5
				image_tag asset_path('nicochan3.png'), class:"diary-image-mypage"
		end
	end

end
