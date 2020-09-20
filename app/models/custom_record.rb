class CustomRecord < ApplicationRecord
	belongs_to :custom
	belongs_to :user

	validates :user_id, presence: true
	validates :custom_id, presence: true
	validates :start_time, presence: true

end
