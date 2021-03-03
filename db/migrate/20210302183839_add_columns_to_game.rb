class AddColumnsToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :price, :float
    add_column :games, :duration, :time
    add_column :games, :number_of_players, :integer
  end
end
