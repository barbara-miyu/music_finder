class PostTag < ApplicationRecord
  belongs_to :song
  belongs_to :tag
end
