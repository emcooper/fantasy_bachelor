describe "Admin visits users index" do
    it "can see all users and edit and delete buttons" do
      admin = create(:user, :admin)
      user1, user2, user3 = create_list(:user, 3)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      expect(page).to have_content(user1.team_name)
      expect(page).to have_content(user2.team_name)
      expect(page).to have_content(user3.team_name)
    end
  end
