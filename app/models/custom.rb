class Custom < ApplicationRecord

	belongs_to :user
	has_many :custom_records

	enum	task_status: [:未達成, :達成]
end
