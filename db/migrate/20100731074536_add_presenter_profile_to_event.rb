class AddPresenterProfileToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :presenter_profile_ja, :text, :default => ""
    add_column :events, :presenter_profile_en, :text, :default => ""
  end

  def self.down
    remove_column :events, :presenter_profile_en
    remove_column :events, :presenter_profile_ja
  end
end
