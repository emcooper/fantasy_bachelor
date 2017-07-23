require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe "associations" do
    it { should have_many(:weekly_contestants) }
    it { should have_many(:weeks).through(:weekly_contestants) }
    it { should have_many(:weekly_scores) }
    it { should belong_to(:user) }
  end
  describe "instance methods" do
    it ".weekly_points returns total points per week" do
      week = create(:week, :with_6_contestants)
      cont1 = week.contestants.first
      cont6 = week.contestants.last
      play1 = create(:play)
      play2 = create(:play)
      create(:weekly_score, contestant: cont1,
                            play: play1,
                            week: week)
      create(:weekly_score, contestant: cont1,
                            play: play2,
                            week: week)

      expect(cont1.weekly_points(week.id)).to eq(play1.point_value + play2.point_value)
      expect(cont6.weekly_points(week.id)).to eq(0)
    end

    it "season_points returns  total points for the season" do
      user = create(:user,  :with_1_contestants_with_5_points_each_week)
      contestant = user.contestants.first

      expect(contestant.season_points).to eq(60)
    end
  end
end
