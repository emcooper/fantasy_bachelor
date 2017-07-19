class WeeklyContestant < ApplicationRecord
  belongs_to :contestant_id
  belongs_to :week_id
end
