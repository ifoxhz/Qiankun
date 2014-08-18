#保存用户的单播消息

class CreateUniMsgs < ActiveRecord::Migration
  def self.up
    create_table :uni_msgs do |t|
      t.string :msg
      t.string :pu_id
      t.string :pc_id
      t.string :apikey
      t.string :succ
      t.timestamps
    end
  end

  def self.down
    drop_table :uni_msgs
  end
end
