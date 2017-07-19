require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe "associations" do
    it { should have_many(:weekly_contestants) }
    it { should have_many(:weeks).through(:weekly_contestants) }
    it { should have_many(:weekly_scores) }
    it { should belong_to(:user) }
  end
end
