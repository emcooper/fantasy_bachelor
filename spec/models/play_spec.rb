require 'rails_helper'

RSpec.describe Play, type: :model do
  describe "associations" do
    it { should have_many(:weekly_scores) }
    it { should have_many(:weekly_plays) }
    it { should have_many(:weeks).through(:weekly_plays) }
  end
end
