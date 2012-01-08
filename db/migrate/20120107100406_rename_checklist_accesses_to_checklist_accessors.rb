class RenameChecklistAccessesToChecklistAccessors < ActiveRecord::Migration
  def self.up
    rename_table :checklist_accesses, :checklist_accessors
  end

  def self.down
    rename_table :checklist_accessors, :checklist_accesses
  end
end
