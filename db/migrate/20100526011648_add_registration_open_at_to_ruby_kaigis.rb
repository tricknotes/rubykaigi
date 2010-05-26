class AddRegistrationOpenAtToRubyKaigis < ActiveRecord::Migration
  def self.up
    add_column :ruby_kaigis, :registration_open_at, :datetime
  end

  def self.down
    remove_column :ruby_kaigis, :registration_open_at
  end
end
