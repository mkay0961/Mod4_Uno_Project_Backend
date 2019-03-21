class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :game_status
      t.string :winner

      t.timestamps
    end
  end
end
