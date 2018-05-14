class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.string :name
      t.string :number_of_teams

      t.timestamps
    end
  end
end
