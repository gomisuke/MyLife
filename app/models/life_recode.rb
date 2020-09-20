class LifeRecode < ApplicationRecord
	belongs_to :user

	validates :user_id, presence: true
	validates :study, presence: true
	validates :sleeping, presence: true
	validates :exercise, presence: true
	validates :study_memo, presence: true, length:{maximum:100}
	validates :sleeping_memo, presence: true, length:{maximum:100}
	validates :exercise_memo, presence: true, length:{maximum:100}
end
