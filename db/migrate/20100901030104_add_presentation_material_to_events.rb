class AddPresentationMaterialToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :presentation_material, :string
  end

  def self.down
    remove_column :events, :presentation_material
  end
end
