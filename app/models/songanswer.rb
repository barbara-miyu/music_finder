class Songanswer < ApplicationRecord
  belongs_to :user
  belongs_to :songquestion
end
