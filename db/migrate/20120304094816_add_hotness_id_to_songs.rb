class AddHotnessIdToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :hotness, :integer
  end

  def self.down
    remove_column :songs, :hotness
  end
end
