class SongType < ApplicationRecord
  belongs_to :song
  belongs_to :type
end
