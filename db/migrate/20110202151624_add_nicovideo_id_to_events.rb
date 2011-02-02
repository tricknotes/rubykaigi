class AddNicovideoIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :nicovideo_id, :string
  end

  def self.down
    remove_column :events, :nicovideo_id
  end
end
