class Contestant < ApplicationRecord
  belongs_to :user
  has_many :weekly_contestants
  has_many :weeks, through: :weekly_contestants
  has_many :weekly_scores
end
