RSpec.feature "User tries to delete user" do
  it "can delete itself and is redirected to sign up page" do
    user1, user2, user3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

    visit user_path(user2)
    click_on("Delete Account")

    expect(current_path).to eq(new_user_path)
  end
  it "cannot delete other users" do
    user1, user2, user3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

    visit user_path(user3)

    expect(page).to_not have_content("Delete")
  end
end
