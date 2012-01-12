class CreateAllocations < ActiveRecord::Migration
  def self.up
    create_table :allocations do |t|
      t.integer :user_id
      t.integer :item_id
      t.boolean :complete, :default => false
      t.integer :distributer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :allocations
  end
end
