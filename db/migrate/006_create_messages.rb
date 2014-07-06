class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :msgtype
      t.string :msg
      t.integer :user_id
      t.integer :node_id
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
