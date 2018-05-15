class CreateStanding < ActiveRecord::Migration[5.2]
  def change
    create_table :standings do |t|
      t.integer :played_matches
      t.integer :wins
      t.integer :draws
      t.integer :losses
      t.integer :goals_scored
      t.integer :goals_conceded
      t.integer :points
      t.references :season, foreign_key: true
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
