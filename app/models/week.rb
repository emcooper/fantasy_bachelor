class Week < ApplicationRecord
  has_many :weekly_plays
  has_many :plays, through: :weekly_plays
  has_many :weekly_contestants
  has_many :contestants, through: :weekly_contestants
  has_many :weekly_scores
end
