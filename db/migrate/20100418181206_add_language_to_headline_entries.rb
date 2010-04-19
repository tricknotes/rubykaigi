class AddLanguageToHeadlineEntries < ActiveRecord::Migration
  def self.up
    add_column :headline_entries, :language, :string
    add_index :headline_entries, :language
  end

  def self.down
    remove_column :headline_entries, :language
  end
end
