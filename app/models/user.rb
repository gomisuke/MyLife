class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :customs, dependent: :destroy
  has_many :custom_records, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :life_recodes, dependent: :destroy
  #refileの設定
  attachment :profile_image

  validates :name, presence: true, length:{maximum:10}
  validates :acount_name, presence: true
  # @\w*   正規表現
  validates :introduction, presence: true, length:{maximum: 100}

end
