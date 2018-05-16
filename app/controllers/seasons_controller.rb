class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def show 
    @season = Season.find(params[:id])
  end

  def new
    @season = Season.new
  end

  def edit
    @season = Season.find(params[:id])
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      add_standings(@season.id)
      redirect_to @season
    else
      render 'new'
    end
  end

  def update
    @season = Season.find(params[:id])
    if @season.update(season_params)
      add_standings(@season.id)
      redirect_to @season
    else
      render 'edit'
    end
  end

  def destroy
    @season = Season.find(params[:id])
    @season.destroy

    redirect_to seasons_path
  end

  private

  def season_params
    params.require(:season).permit(:name, club_ids:[])
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
