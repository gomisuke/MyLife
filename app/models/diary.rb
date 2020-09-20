class Diary < ApplicationRecord
	belongs_to :user
	belongs_to :genre

	validates :user_id, presence: true
	validates :genre_id, presence: true
	validates :title, presence: true, length:{maximum:50}
	validates :body, presence: true, length:{maximum:500}
	validates :diary_date, presence: true
	validates :adequacy, presence: true

end
