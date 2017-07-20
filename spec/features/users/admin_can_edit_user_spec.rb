RSpec.feature "User edits an user" do
  context "as admin" do
    admin = create(:user, :admin)
    user1, user2 = create_list(:user, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    click_link("Edit", :match => :first)
    fill_in "user_email", with: "new_email@email.com"
    fill_in "user_team_name", with: "New Name"
    check("admin?")
    click_on "Update User"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("new_email@email.com")
    expect(page).to have_content("new_team_name")
    expect(page).to have_content("Admin")
    expect(page).to_not have_content("gmail.com")
  end
  context "as default user" do

  end
end
