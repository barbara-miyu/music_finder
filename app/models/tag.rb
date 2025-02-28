class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :songs, through: :post_tags, dependent: :destroy
end
