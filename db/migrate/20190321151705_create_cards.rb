class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :number
      t.string :color
      t.integer :game_position
      t.integer :game_id

      t.timestamps
    end
  end
end
