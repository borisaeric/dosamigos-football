class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.bigint :home_club_id
      t.bigint :away_club_id
      t.integer :home_club_score
      t.integer :away_club_score
      t.references :season, foreign_key: true

      t.timestamps
    end
    add_foreign_key :matches, :clubs, column: :home_club_id
    add_foreign_key :matches, :clubs, column: :away_club_id
  end
end
