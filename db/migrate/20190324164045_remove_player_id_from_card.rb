class RemovePlayerIdFromCard < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :player_id, :integer
  end
end
