class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :item_id
      t.boolean :complete, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
