RSpec.feature "User visits league page" do
  it "sees league summary table" do
    user1 = create(:user, :with_12_weeks,
                          :with_1_contestants_with_5_points_each_week,
                          :with_1_contestants_with_10_points_each_week)

    user2 = create(:user, :with_1_contestants_with_5_points_each_week)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit ("/league")

    within("tbody tr[1]") do
      expect(page).to have_content(user1.team_name)
      expect(page).to have_content("15", count: 12)
      expect(page).to have_content("180", count: 1)
    end
    within("tbody tr[2]") do
      expect(page).to have_content(user2.team_name)
      expect(page).to have_content("5", count: 12)
      expect(page).to have_content("60", count: 1)
    end
  end
end
