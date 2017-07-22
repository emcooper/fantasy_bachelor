require 'rails_helper'

RSpec.describe WeeklyScore, type: :model do
  describe "assocations" do
    it { should belong_to(:week) }
    it { should belong_to(:play) }
    it { should belong_to(:contestant) }
  end
  describe "instance methods" do
    it ".point_total returns total points for record" do
      play1 = create(:play, point_value: 5)
      weekly_score = create(:weekly_score, play: play1, play_count: 3)

      expect(weekly_score.point_total).to eq(15)
    end
  end
end
