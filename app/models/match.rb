class Match < ApplicationRecord
  belongs_to :home_club, foreign_key: :home_club_id, class_name: 'Club'
  belongs_to :away_club, foreign_key: :away_club_id, class_name: 'Club'
  belongs_to :season

  validates :season_id, uniqueness: { scope: [:home_club_id, :away_club_id] }
  validate :match_teams_valid
  validate :home_club_season_valid
  validate :away_club_season_valid

  validates :season_id,
            :home_club_id,
            :away_club_id,
            :home_club_score,
            :away_club_score, presence: true

  validates :home_club_score,
            :away_club_score, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def match_teams_valid
    return unless home_club_id == away_club_id
    errors.add(:base, 'Clubs cannot play against itself')
  end

  def home_club_season_valid
    season = Season.find(season_id)
    return if season.clubs.exists?(home_club_id)
    errors.add(:base, 'Home club does not exists in season')
  end

  def away_club_season_valid
    season = Season.find(season_id)
    return if season.clubs.exists?(away_club_id)
    errors.add(:base, 'Away club does not exists in season')
  end

  def add_stats_to_match(add_or_delete)
    standing_home = Standing.find_by(club_id: home_club_id, season_id: season_id)
    standing_away = Standing.find_by(club_id: away_club_id, season_id: season_id)
    if(home_club_score > away_club_score)
      standing_home.match_score("win", home_club_score, away_club_score, add_or_delete)
      standing_away.match_score("defeat", away_club_score, home_club_score, add_or_delete)
    end
    if(home_club_score < away_club_score)
      standing_away.match_score("win", away_club_score, home_club_score, add_or_delete)
      standing_home.match_score("defeat", home_club_score, away_club_score, add_or_delete)
    end
    if(home_club_score == away_club_score)
      standing_away.match_score("draw", away_club_score, home_club_score, add_or_delete)
      standing_home.match_score("draw", home_club_score, away_club_score, add_or_delete)
    end 
  end
end