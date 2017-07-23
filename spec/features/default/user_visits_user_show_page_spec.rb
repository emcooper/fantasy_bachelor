RSpec.feature "User visits individual show page" do
  it "can see season summary table" do
    user = create(:user,  :with_12_weeks,
                          :with_1_contestants_with_5_points_each_week,
                          :with_1_contestants_with_10_points_each_week)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    within("tbody tr[1]") do
      expect(page).to have_content(user.contestants.first.name)
      expect(page).to have_content("5", count: 12)
      expect(page).to have_content("60", count: 1)
    end
    within("tbody tr[2]") do
      expect(page).to have_content(user.contestants.second.name)
      expect(page).to have_content("10", count: 12)
      expect(page).to have_content("120", count: 1)
    end
    within("tbody tr[3]") do
      expect(page).to have_content("15", count: 12)
      expect(page).to have_content("180", count: 1)
    end
  end
end
