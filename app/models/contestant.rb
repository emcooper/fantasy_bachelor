class Contestant < ApplicationRecord
  belongs_to :user
  has_many :weekly_contestants
  has_many :weeks, through: :weekly_contestants
  has_many :weekly_scores

  def weekly_points(week_id)
    weekly_plays = WeeklyScore.where("contestant_id = ? AND week_id = ?", self.id, week_id)
    weekly_plays_joins_plays = weekly_plays.joins(:play)
    weekly_plays_joins_plays.sum("play_count * point_value")
  end
end
