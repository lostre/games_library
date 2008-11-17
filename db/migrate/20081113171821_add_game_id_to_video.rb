class AddGameIdToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :game_id, :integer
  end

  def self.down
    remove_column :videos, :game_id
  end
end
