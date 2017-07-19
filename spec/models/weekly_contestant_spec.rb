require 'rails_helper'

RSpec.describe WeeklyContestant, type: :model do
  describe "associations" do
    it { should belong_to(:week) }
    it { should belong_to(:contestant) }
  end
end
