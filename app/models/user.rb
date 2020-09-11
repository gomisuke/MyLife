class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :customs, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :likes, dependent: :destroy
  #refileの設定
  attachment :profile_image
end
