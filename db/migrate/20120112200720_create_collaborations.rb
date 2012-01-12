class CreateCollaborations < ActiveRecord::Migration
  def self.up
    create_table :collaborations do |t|
      t.integer :user_id
      t.integer :item_id
      t.boolean :complete, :default => false
      t.integer :allocator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :collaborations
  end
end
