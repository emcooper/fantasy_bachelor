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
end
