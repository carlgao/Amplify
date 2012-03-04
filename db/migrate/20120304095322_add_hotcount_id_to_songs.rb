class AddHotcountIdToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :hotcount, :integer
  end

  def self.down
    remove_column :songs, :hotcount
  end
end
