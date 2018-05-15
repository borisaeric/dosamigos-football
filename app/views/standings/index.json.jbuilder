json.standings @standings do |standing|
  json.club standing.club.name
  json.matches_played standing.played_matches
  json.wins standing.wins
  json.draws standing.draws
  json.goals_scored standing.goals_scored
  json.goals_conceded standing.goals_conceded
  json.points standing.points
end