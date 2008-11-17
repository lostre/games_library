class AddMinrequirementRecrequirementToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :minrequirement, :text
    add_column :games, :recrequirement, :text
  end

  def self.down
    remove_column :games, :recrequirement
    remove_column :games, :minrequirement
  end
end
