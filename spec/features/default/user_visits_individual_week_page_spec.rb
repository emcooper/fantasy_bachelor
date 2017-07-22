RSpec.feature "User visits individual week page" do
  it "can see all contestants for that week and point totals" do
    week = create(:week, :with_6_contestants)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit week_path(week)
    expect(page).to have_content(week.contestants.first.name)
    expect(page).to have_content(week.contestants.last.name)
    expect(page).to have_content("Total Points: 0", count: 6)
    expect(page).to have_css("img", count:6)
  end
end
