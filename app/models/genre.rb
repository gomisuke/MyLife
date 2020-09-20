class Genre < ApplicationRecord
  belongs_to :user
  has_many :diaries, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true, length:{maximum:15}
end
