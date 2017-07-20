RSpec.feature "Default user edits an user" do
    it "can edit its team_name but not role or email" do
      user1, user2 = create_list(:user, 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

      visit user_path(user2)
      click_link("Edit")

      expect(page).to have_content("Edit Your Account")
      expect(page).to_not have_content("email")
      expect(page).to_not have_content("Admin?")

      fill_in "user_team_name", with: "New Name"
      click_on "Update Account"

      expect(current_path).to eq(user_path(user2))
      expect(page).to have_content("New Name")
      expect(page).to_not have_content("Admin")
    end
    it "cannot see edit button for other and edit others " do
      user1, user2 = create_list(:user, 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit user_path(user2)

      expect(page).to_not have_content("Edit")

      visit edit_user_path(user2)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
end
