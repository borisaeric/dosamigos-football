class Club < ApplicationRecord
  has_and_belongs_to_many :seasons
  has_many :home_matches, foreign_key: :home_club_id, class_name: 'Match'
  has_many :away_matches, foreign_key: :away_club_id, class_name: 'Match'

  validates :name, presence: true,
                   length: { minimum: 3 },
                   uniqueness: true

  validates :stadium, presence: true,
                      length: { minimum: 3}
end
