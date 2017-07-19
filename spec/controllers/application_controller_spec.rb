RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      @current_user = current_user
      render plain: "Hello World"
    end
  end
  describe "current_user" do
    it "assigns the logged in user to @user" do
      user = create(:user)
      session[:user_id] = user.id
      get :index

      expect(assigns(:current_user)).to eq(user)
    end
    it "is nil when no user is logged in" do
      get :index

      expect(assigns(:current_user)).to be_nil
    end
  end
end
