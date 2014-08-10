class CreatePushUsers < ActiveRecord::Migration
  def self.up
    create_table :push_users do |t|
      t.string :pu_id
      t.string :pc_id
      t.string :b_key
      t.string :sv_num
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :push_users
  end
end
