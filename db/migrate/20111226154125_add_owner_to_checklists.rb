class AddOwnerToChecklists < ActiveRecord::Migration
  def self.up
    add_column :checklists, :owner_id, :integer
  end

  def self.down
    remove_column :checklists, :owner_id
  end
end
