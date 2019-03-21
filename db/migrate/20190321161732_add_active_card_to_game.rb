class AddActiveCardToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :active_card_id, :integer
  end
end
