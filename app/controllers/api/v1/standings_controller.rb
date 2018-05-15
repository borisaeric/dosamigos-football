module Api
  module V1   
    class StandingsController < ApiController
      def index
        season = Season.find(params[:season_id])
        @standings = season.standings.order(points: :desc)

        render 'standings/index.json.jbuilder', status: :ok
      end
    end
  end
end