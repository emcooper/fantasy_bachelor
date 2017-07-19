class Play < ApplicationRecord
  has_many :weekly_plays
  has_many :plays, through: :weekly_plays
  has_many :weekly_scores
end
