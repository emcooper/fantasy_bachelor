RSpec.feature "User can sign up for account" do
  context "with valid username and password" do
    it "they are able to sign up and are redirected to profile" do
      team_name = "Team I'm Not Here to Make Friends"
      email = "ln@gmail.com"
      password = "password123"

      visit new_user_path
      fill_in "user_team_name", with: team_name
      fill_in "user_email", with: email
      fill_in "user_password", with: password
      fill_in "user_password_confirmation", with: password
      click_on "Sign Up!"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("You've successfully created an account!")
      expect(page).to have_content(team_name)
    end
  end
end
