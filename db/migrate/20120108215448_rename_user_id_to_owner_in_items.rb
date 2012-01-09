class RenameUserIdToOwnerInItems < ActiveRecord::Migration
  def self.up
    rename_column :items, :user_id, :owner_id
  end

  def self.down
    rename_column :items, :owner_id, :user_id
  end
end
