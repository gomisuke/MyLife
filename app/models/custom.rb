class Custom < ApplicationRecord
	belongs_to :user
	has_many :custom_records, dependent: :destroy

	validates :user_id, presence: true
	validates :task, presence: true, length:{maximum:20}
	validates :task_status, presence: true

	enum	task_status: [:未達成, :達成]

	def self.task_complete
		unless self.count == 0
			@task = self.pluck(:task_status)
			@task.all?{|task| task == "達成"}
		end
	end
end
