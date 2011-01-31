class AddVimeoIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :vimeo_id, :integer
  end

  def self.down
    remove_column :events, :vimeo_id
  end
end
