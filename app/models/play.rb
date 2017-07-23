class Play < ApplicationRecord
  has_many :weekly_plays, dependent: :destroy
  has_many :weeks, through: :weekly_plays
  has_many :weekly_scores, dependent: :destroy
end
