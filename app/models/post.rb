class Post < ApplicationRecord

	belongs_to :user

	#refileの設定
	attachment :post_image
end
