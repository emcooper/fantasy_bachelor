RSpec.feature "User edits an user" do
  context "as admin" do
    it "can edit another user team_name and role but not password or email" do
      admin = create(:user, :admin, team_name: "Admin Team")
      user1, user2 = create_list(:user, 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path
      click_on "#{user2.team_name}"
      click_link("Edit Account")

      expect(page).to have_content("Edit #{user2.team_name}")
      expect(page).to_not have_content("password")
      expect(page).to_not have_content("email")

      fill_in "user_team_name", with: "New Name"
      check("admin?")
      click_on "Update Account"

      expect(current_path).to eq(user_path(user2))
      expect(page).to have_content("New Name")
      expect(page).to have_content("Admin")
    end
  end
end
