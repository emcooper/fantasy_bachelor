class WeeksController < ApplicationController
  before_action :find_week, only: [:show]

  def show
    @weekly_score = WeeklyScore.new
  end

  private

  def find_week
    @week = Week.find(params[:id])
  end
end
