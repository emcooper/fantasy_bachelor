require 'rails_helper'

RSpec.describe WeeklyPlay, type: :model do
  describe "assocations" do
    it { should belong_to(:week) }
    it { should belong_to(:play) }
  end
end
