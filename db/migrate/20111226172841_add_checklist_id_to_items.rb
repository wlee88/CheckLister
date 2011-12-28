class AddChecklistIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :checklist_id, :integer
  end

  def self.down
    remove_column :items, :checklist_id
  end
end
