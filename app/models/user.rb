class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :songs, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: {maximum: 200}

  has_many :likes, dependent: :destroy
  has_many :liked_songs, through: :likes, source: :song

  has_many :comments, dependent: :destroy
  has_many :songquestions, dependent: :destroy
  has_many :songanswers, dependent: :destroy

  mount_uploader :image, ImageUploader

  def already_liked?(song)
    self.likes.exists?(song_id: song.id)
  end

end
