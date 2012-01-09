class RenameItemTitleToContentInItems < ActiveRecord::Migration
  def self.up
    rename_column :items, :title, :content
  end

  def self.down
    rename_column :items, :content, :title
  end
end
