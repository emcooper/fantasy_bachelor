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

  def season_progression
    result = {}
    Week.all.each do |week|
      result[week.week_number] = self.cumulative_points(week.id)
    end
    return result
  end

  def cumulative_points(week_id)
    week = Week.find(week_id)
    week_and_prior_weeks = Week.where("date <= ?", week.date)
    week_and_prior_weeks.reduce(0) {|sum, w| sum + self.week_points(w.id)}
  end
end
