class StandingsController < ApplicationController
  def index
    @season = Season.find(params[:season_id])
    @standings = @season.standings.order(points: :desc)
  end
end
