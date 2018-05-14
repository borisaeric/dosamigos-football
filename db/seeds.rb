# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
club_list = [
  ["Alaves", "Stadium"],
  ["Ath. Bilbao", "Stadium"],
  ["Atl. Madrid", "Stadium"],
  ["Barcelona", "Stadium"],
  ["Betis", "Stadium"],
  ["Celta Vigo", "Stadium"],
  ["Dep. La Coruna", "Stadium"],
  ["Eibar", "Stadium"],
  ["Espanyol", "Stadium"],
  ["Getafe", "Stadium"],
  ["Girona", "Stadium"],
  ["Las Palmas", "Stadium"],
  ["Leganes", "Stadium"],
  ["Levante", "Stadium"],
  ["Malaga", "Stadium"],
  ["Real Madrid", "Stadium"],
  ["Real Sociedad", "Stadium"],
  ["Sevilla", "Stadium"],
  ["Valencia", "Stadium"],
  ["Villarreal", "Stadium"]
]

club_list.each do |club|
  Club.create(:name => club[0], :stadium => club[1])
end