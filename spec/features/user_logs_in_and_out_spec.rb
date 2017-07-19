RSpec.feature "User logs in and out" do
  context "with valid credentials" do
    scenario "they are logged in and see profile page" do
      email = "me@gmail.com"
      password = "password123"
      user = create(:user, email: email, password: password)

      visit login_path
      fill_in "session_email", with: email
      fill_in "session_password", with: password
      click_on "Log In"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(user.team_name)

      click_on "Log Out"

      expect(current_path).to eq(root_path)
      expect(page).to_not have_content(user.team_name)
    end
  end
end
