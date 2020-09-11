class Custom < ApplicationRecord

	belongs_to :user
	has_many :custom_records

	enum	task_status: [:未達成, :達成]



	def reset_task
		customs = self.all
		customs.each do |custom|
			custom.task_status = 0
			custom.save
		end
	end

end
