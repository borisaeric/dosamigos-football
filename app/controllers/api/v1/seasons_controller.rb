module Api
  module V1    
    class SeasonsController < ApiController
      rescue_from ActiveRecord::RecordNotFound, with: :club_or_season_not_found
      
      def index
        seasons = Season.all
        render json: { seasons: seasons }
      end

      def show 
        season = Season.find_by(id: params[:id])
        render json: { season: season }
      end

      def create
        season = Season.new(season_params)
        if season.save
          render json: { season: season }, status: :created
        else
          render json: { errors: season.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        season = Season.find(params[:id])
        if season.update(season_params)
          render json: { season: season }, status: :ok
        else
          render json: { errors: season.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        season = Season.find(params[:id])
        season.destroy
        head :no_content
      end

      private

      def season_params
        params.require(:season).permit(:name, club_ids:[])
      end

      def club_or_season_not_found
        render json: { error: 'Club or season not found' }, status: 404
      end
    end
  end
end