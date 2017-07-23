class WeeklyScoresController < ApplicationController
  def create
    contestant_id = weekly_score_params[:contestant_id][0]
    week_id = weekly_score_params[:week_id][0]
    plays = weekly_score_params[:plays]
    plays.each do |play_id, count|
      WeeklyScore.create( contestant_id: contestant_id,
                          week_id: week_id,
                          play_id: play_id,
                          play_count: count[0])
    end
    redirect_to "/weeks/#{week_id[0]}"
  end

  private

  def weekly_score_params
    params.require(:weekly_score).permit(contestant_id: [], week_id: [], plays: {})
  end
end
