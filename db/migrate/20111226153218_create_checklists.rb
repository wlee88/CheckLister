class CreateChecklists < ActiveRecord::Migration
  def self.up
    create_table :checklists do |t|
      t.string :title
      t.string :descripton
      t.integer :item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :checklists
  end
end
