class Songquestion < ApplicationRecord
  has_many :songanswers, dependent: :destroy
  belongs_to :users, optional: true
end
