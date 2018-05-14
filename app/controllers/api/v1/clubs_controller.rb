module Api
  module V1   
    class ClubsController < ApiController
      rescue_from ActiveRecord::RecordNotFound, with: :club_not_found

      def index
        clubs = Club.all
        render json: { clubs: clubs }, status: :ok
      end

      def show
        club = Club.find(params[:id])
        render json: { club: club }, status: :ok
      end

      def create
        club = Club.new(club_params)
        if club.save
          render json: { club: club }, status: :created
        else
          render json: { errors: club.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        club = Club.find(params[:id])
        if club.update(club_params)
          render json: { club: club }, status: :ok
        else
          render json: { errors: club.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        club = Club.find(params[:id])
        club.destroy
        head :no_content
      end

      private

      def club_params
        params.require(:club).permit(:name, :stadium)
      end

      def club_not_found
        render json: { error: 'Club not found' }, status: 404
      end
    end
  end
end