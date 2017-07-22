class WeeksController < ApplicationController
  before_action :find_week, only: [:show]

  def show

  end

  private

  def find_week
    @week = Week.find(params[:id])
  end
end
