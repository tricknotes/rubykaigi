class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.references :rubyist, :null => false
      t.references :ruby_kaigi, :null => false
      t.string :contribution_type, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :contributions
  end
end
