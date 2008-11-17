class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name
      t.boolean :available
      t.string :size
      t.integer :category_id
      t.date :release_date
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
