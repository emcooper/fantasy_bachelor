class LeaguesController < ApplicationController
  def show
    @users = User.all
  end
end
