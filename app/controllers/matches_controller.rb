class MatchesController < ApplicationController
  def index
    season = Season.find(params[:season_id])
    @matches = season.matches
  end

  def show
    season = Season.find(params[:season_id])
    @match = season.matches.find(params[:id])
  end

  def new
    season = Season.find(params[:season_id])
    @match = season.matches.build
  end

  def edit
    @match = Match.find(params[:id])
  end

  def create
    season = Season.find(params[:season_id])
    @match = season.matches.new(match_params)
    if @match.save
      redirect_to season_match_path(@match.season, @match)
    else
      render 'new'
    end
  end

  def update
    season = Season.find(params[:season_id])
    @match = season.matches.find(params[:id])
    if @match.update(match_params)
      redirect_to season_match_path(@match.season, @match)
    else
      render 'edit'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    
    redirect_to season_matches_path(@match.season)
  end

  private

  def match_params
    params.require(:match).permit(:home_club_id, :away_club_id, :home_club_score, :away_club_score)
  end
end
