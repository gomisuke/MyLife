class Post < ApplicationRecord
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings
	#refileの設定
	attachment :post_image

	validates :user_id, presence: true
	validates :content, presence: true, length:{maximum:30}
	validates :post_image_id, presence: true
	validates :post_status, presence: true

	def liked_by?(user)
  		likes.where(user_id: user.id).exists?
	end

	def save_tag(sent_tags)
		current_tags = self.tags.pluck(:name) unless self.tags.nil?
		old_tags = current_tags - sent_tags
		new_tags = sent_tags - current_tags

		old_tags.each do |old|
			self.tags.delete Tag.find_by(name: old)
		end

		new_tags.each do |new|
			new_post_tag = Tag.find_or_create_by(name: new)
			self.tags << new_post_tag
		end
	end

end
