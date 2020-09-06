class Custom < ApplicationRecord

	belongs_to :user
	has_many :custom_records
end
