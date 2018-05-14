class CreateJoinTableLeagueTeam < ActiveRecord::Migration[5.2]
  def change
    create_join_table :seasons, :clubs do |t|
      t.index [:season_id, :club_id]
    end
  end
end
