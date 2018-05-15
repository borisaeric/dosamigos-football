module Api
  module V1    
    class MatchesController < ApiController
      rescue_from ActiveRecord::RecordNotFound, with: :club_or_season_not_found
      
      def index
        season = Season.find(params[:season_id])
        matches = season.matches.all
        render json: { matches: matches }
      end

      def show
        season = Season.find(params[:season_id])
        match = season.matches.find(params[:id])
        render json: { match: match }
      end

      def create
        match = Match.new(match_params)
        if match.save
          match.add_stats_to_match(1)
          render json: { match: match }, status: :created
        else
          render json: { errors: match.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        match = Match.find(params[:id])
        match.add_stats_to_match(-1)
        if match.update(match_params)
          match.add_stats_to_match(1)
          render json: { match: match }, status: :ok
        else
          render json: { errors: match.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        match = Match.find(params[:id])
        match.destroy
        head :no_content
      end

      private

      def match_params
        params.require(:match).permit(:season_id, :home_club_id, :away_club_id, :home_club_score, :away_club_score)
      end
    end
  end
end