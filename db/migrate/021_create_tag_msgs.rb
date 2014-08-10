class CreateTagMsgs < ActiveRecord::Migration
  def self.up
    create_table :tag_msgs do |t|
      t.string :msg
      t.string :pu_id
      t.integer :pc_id
      t.string :apikey
      t.string :succ
      t.string :tag
      t.timestamps
    end
  end

  def self.down
    drop_table :tag_msgs
  end
end
