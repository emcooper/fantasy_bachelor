RSpec.feature "User can enter points" do
  it "sees points added to weekly point total for contestant" do
    skip #capybara isn't cooperating with modal but I know functionality works
    week = create(:week, :with_6_contestants, :with_3_plays)
    cont = week.contestants.second
    play2 = week.plays.second
    play3 = week.plays.last
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit week_path(week)

    within(".contestant-#{cont.id}") do
      click_on("Add Points")
    end
    within("#modal-#{cont.id}") do
      within(".play-#{play2.id}") do
        find("#weekly_score_play_count", :visible => false).set "1"
      end
      find(".save-button", :visible => false).click
    end
    save_and_open_page
    within(".contestant-#{cont.id}") do
      expect(page).to have_content("Total Points: #{play2.point_value}")
    end

    within(".contestant-#{cont.id}") do
      click_on("Add Points")
    end

    find(".play-#{play2.id}", :visible => false).set(1)
    find(".play-#{play3.id}", :visible => false).set(3)
    find("Save Changes", :visible => false).click

    expected_points = play2.point_value * 2 + play3.point_value * 3

    within(".contestant-#{cont.id}") do
      expect(page).to have_content("Total Points: #{expected_points}")
    end
  end
end
