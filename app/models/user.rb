class User < ApplicationRecord
  has_secure_password
  has_many :contestants

  enum role: %w(default admin)

  def week_points(week_id)
    self.contestants.reduce(0) {|sum, cont| sum + cont.weekly_points(week_id)}
  end

  def season_points
    self.contestants.reduce(0) {|sum, cont| sum + cont.season_points}
  end
end
