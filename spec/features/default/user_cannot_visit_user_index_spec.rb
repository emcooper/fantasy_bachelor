describe "Default user visits users index" do
    it "cannot see users and sees 404" do
      user = create(:user)
      user1, user2, user3 = create_list(:user, 3)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_users_path

      expect(page).to_not have_content(user1.team_name)
      expect(page).to_not have_content(user2.team_name)
      expect(page).to_not have_content(user3.team_name)
      expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
