class CreateRubyKaigis < ActiveRecord::Migration
  def self.up
    create_table :ruby_kaigis do |t|
      t.integer :year, :unique => true, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :ruby_kaigis
  end
end
