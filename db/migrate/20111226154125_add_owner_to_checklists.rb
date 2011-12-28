class AddOwnerToChecklists < ActiveRecord::Migration
  def self.up
    add_column :checklists, :owner, :integer
  end

  def self.down
    remove_column :checklists, :owner
  end
end
