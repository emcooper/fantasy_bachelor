require 'rails_helper'

RSpec.describe Week, type: :model do
  describe "associations" do
    it { should have_many(:weekly_contestants) }
    it { should have_many(:weekly_plays) }
    it { should have_many(:weekly_scores) }
    it { should have_many(:contestants).through(:weekly_contestants) }
    it { should have_many(:plays).through(:weekly_plays) }
  end
end
