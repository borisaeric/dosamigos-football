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
          add_standings(season.id)
          render json: { season: season }, status: :created
        else
          render json: { errors: season.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        season = Season.find(params[:id])
        if season.update(season_params)
          add_standings(season.id)
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

      def add_standings(season_id)
        season_params[:club_ids].each do |club_id|
          unless(Standing.exists?(club_id: club_id, season_id: season_id))
            standing = Standing.new
            standing.club_id = club_id
            standing.season_id = season_id
            standing.init
            standing.save
          end
        end
      end
    end
  end
end