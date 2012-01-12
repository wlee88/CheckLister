class CreateChecklistAccessors < ActiveRecord::Migration
  def self.up
    create_table :checklist_accessors do |t|
      t.integer :user_id
      t.integer :checklist_id
    end
  end

  def self.down
    drop_table :checklist_accessors
  end
end

