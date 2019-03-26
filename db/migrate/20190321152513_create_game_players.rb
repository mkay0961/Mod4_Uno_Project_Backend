class CreateGamePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_players do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :seat

      t.timestamps
    end
  end
end
