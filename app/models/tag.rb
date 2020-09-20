class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings

  validates :name, presence: true, length:{maximum:15}


  #検索機能
  def self.search(search)
  	Tag.where(['name LIKE ?', "%#{search}%"])
  end

end
