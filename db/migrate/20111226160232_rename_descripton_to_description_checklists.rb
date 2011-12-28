class RenameDescriptonToDescriptionChecklists < ActiveRecord::Migration
  def self.up
    rename_column :checklists, :descripton, :description
  end

  def self.down
    rename_column :checklists, :description, :descripton
  end
end
