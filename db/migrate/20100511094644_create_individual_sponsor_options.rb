class CreateIndividualSponsorOptions < ActiveRecord::Migration
  def self.up
    create_table :individual_sponsor_options do |t|
      t.integer :additional_amount, :null => false, :default => 0
      t.string :link_label
      t.string :link_url
      t.boolean :attend_party, :null => false, :default => false
      t.integer :order_item_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :individual_sponsor_options
  end
end
