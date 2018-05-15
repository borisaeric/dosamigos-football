class Standing < ApplicationRecord
  belongs_to :season
  belongs_to :club

  def init
    self.played_matches = 0
    self.wins = 0
    self.losses = 0
    self.draws = 0
    self.goals_scored = 0
    self.goals_conceded = 0
    self.points = 0
  end

  def match_score(result, goals_scored, goals_conceded, add_or_delete)
    self.played_matches += 1*add_or_delete
    self.goals_scored += goals_scored*add_or_delete
    self.goals_conceded += goals_conceded*add_or_delete
    case result
    when "win"
      self.wins += 1*add_or_delete
      self.points += 3*add_or_delete
    when "draw"
      self.draws += 1*add_or_delete
      self.points += 1*add_or_delete
    when "defeat"
      self.losses += 1*add_or_delete
    end
    self.save
  end
end