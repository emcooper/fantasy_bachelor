require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:contestants) }
  end
  describe "role" do
    it "can be created as an admin" do
      user = create(:user, :admin)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end
    it "can be created as a default user" do
      user = create(:user)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end
  describe "instance methods" do
    it ".week_total returns total points for week" do
      user = create(:user,  :with_12_weeks,
                            :with_1_contestants_with_5_points_each_week,
                            :with_1_contestants_with_10_points_each_week)

      expect(user.week_points(Week.first.id)).to eq(15)
      expect(user.week_points(Week.last.id)).to eq(15)
    end
    it ".season_total returns total points for season" do
      user = create(:user,  :with_12_weeks,
                            :with_1_contestants_with_5_points_each_week,
                            :with_1_contestants_with_10_points_each_week)

      expect(user.season_points).to eq(180)
    end
    it ".season_progression returns hash of weeks and totals" do
      user = create(:user,  :with_3_weeks,
                            :with_1_contestants_with_5_points_each_week)

      expected = {Week.first.week_number => 5,
                  Week.second.week_number => 10,
                  Week.last.week_number => 15}

      expect(user.season_progression).to eq(expected)
    end
    it ".cumulative_points returns cumulative points up to given week" do
      user = create(:user,  :with_3_weeks,
                            :with_1_contestants_with_5_points_each_week)

      expect(user.cumulative_points(Week.second.id)).to eq(10)
      expect(user.cumulative_points(Week.last.id)).to eq(15)
    end
  end
end
