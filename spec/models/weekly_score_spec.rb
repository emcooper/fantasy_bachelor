require 'rails_helper'

RSpec.describe WeeklyScore, type: :model do
  describe "assocations" do
    it { should belong_to(:week) }
    it { should belong_to(:play) }
    it { should belong_to(:contestant) }
  end
end
