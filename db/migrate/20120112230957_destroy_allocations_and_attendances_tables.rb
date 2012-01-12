class DestroyAllocationsAndAttendancesTables < ActiveRecord::Migration
  def self.up
    drop_table :allocations
    drop_table :attendances
  end

  def self.down
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :item_id
      t.boolean :complete, :default => false
      t.timestamps
    end
    
    create_table :allocations do |t|
      t.integer :user_id
      t.integer :item_id
      t.boolean :complete, :default => false
      t.integer :distributer_id

      t.timestamps
    end
  end
end
