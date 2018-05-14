class Match < ApplicationRecord
  belongs_to :home_club, foreign_key: :home_club_id, class_name: 'Club'
  belongs_to :away_club, foreign_key: :away_club_id, class_name: 'Club'
  belongs_to :season
end