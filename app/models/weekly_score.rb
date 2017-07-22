class WeeklyScore < ApplicationRecord
  belongs_to :contestant
  belongs_to :play
  belongs_to :week

  def point_total
    self.play.point_value * self.play_count
  end
end
