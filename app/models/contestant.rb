class Contestant < ApplicationRecord
  belongs_to :user
  has_many :weekly_contestants
  has_many :weeks, through: :weekly_contestants
  has_many :weekly_scores

  def weekly_points(week_id)
    weekly_plays = WeeklyScore.where("contestant_id = ? AND week_id = ?", self.id, week_id)
    sum_points(weekly_plays)
  end

  def season_points
    season_plays = WeeklyScore.where("contestant_id = ?", self.id)
    sum_points(season_plays)
  end

  def sum_points(plays)
    join_with_play = plays.joins(:play)
    join_with_play.sum("play_count * point_value")
  end
end
