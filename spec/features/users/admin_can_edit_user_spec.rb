RSpec.feature "User edits an user" do
  context "as admin" do
    it "can edit another user team_name and role but not password or email" do
      admin = create(:user, :admin, team_name: "Admin Team")
      user1, user2 = create_list(:user, 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path
      within (".index-user-#{user2.id}") do
        click_link("Edit")
      end

      expect(page).to have_content("Edit #{user2.team_name}")
      expect(page).to_not have_content("password")
      expect(page).to_not have_content("email")

      fill_in "user_team_name", with: "New Name"
      check("admin?")
      click_on "Update User"

      expect(current_path).to eq(user_path(user2))
      expect(page).to have_content("New Name")
      expect(page).to have_content("Admin")
    end
  end
  context "as default user" do
    it "can edit its team_name and password but not role or email" do
      user1, user2 = create_list(:user, 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

      visit user_path(user1)
      click_link("Edit")

      expect(page).to have_content("Edit Your Account")
      expect(page).to have_content("password")
      expect(page).to_not have_content("email")
      expect(page).to_not have_content("admin?")

      fill_in "user_team_name", with: "New Name"
      check("admin?")
      click_on "Update User"

      expect(current_path).to eq(user_path(user2))
      expect(page).to have_content("New Name")
      expect(page).to have_content("Admin")
    end
    it "cannot edit others" do

    end
  end
end
