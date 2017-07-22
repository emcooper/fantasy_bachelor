class Contestant < ApplicationRecord
  belongs_to :user
  has_many :weekly_contestants
  has_many :weeks, through: :weekly_contestants
  has_many :weekly_scores

  def weekly_points(week_id)
    weekly_plays = WeeklyScore.where("contestant_id = ? AND week_id = ?", self.id, week_id)
    score = 0
    weekly_plays.each do |play|
      score += play.play.point_value * play.play_count
    end
    return score
  end
end
