class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.string :video_url

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
