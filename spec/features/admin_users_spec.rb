describe "User visits users index" do
  context "as admin" do
    it "allows admin to see all users" do
      admin = create(:user, :admin)
      user1, user2, user3 = create_list(:user, 3)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      expect(page).to have_content(user1.team_name)
      expect(page).to have_content(user2.team_name)
      expect(page).to have_content(user3.team_name)
      # expect(page).to have_content("Edit")
      # expect(page).to have_content("Delete")
    end
  end
  context "as default user" do
    it "should not render users and render 404" do
      skip
      user = create(:user)
      user1, user2, user3 = create_list(:user, 3)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit_admin_users

      expect(page).to_not have_content(user1.team_name)
      expect(page).to_not have_content(user2.team_name)
      expect(page).to_not have_content(user3.team_name)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
