class AddSourceIdToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :source, :string
  end

  def self.down
    remove_column :songs, :source
  end
end
