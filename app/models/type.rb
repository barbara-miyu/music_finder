class Type < ApplicationRecord
  has_many :song_types, dependent: :destroy
  has_many :songs, through: :song_types, dependent: :destroy
end
