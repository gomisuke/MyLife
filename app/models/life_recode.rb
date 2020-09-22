class LifeRecode < ApplicationRecord
	belongs_to :user

	validates :user_id, presence: true
	validates :study_time, presence: true
	validates :sleeping_time, presence: true
	validates :exercise_time, presence: true
	validates :study_memo, length:{maximum:100}
	validates :sleeping_memo, length:{maximum:100}
	validates :exercise_memo, length:{maximum:100}
end
