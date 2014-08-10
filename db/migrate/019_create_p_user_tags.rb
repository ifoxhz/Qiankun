class CreatePUserTags < ActiveRecord::Migration
  def self.up
    create_table :p_user_tags do |t|
      t.string :pu_id
      t.string :pc_id
      t.string :b_key
      t.string :tag
      t.integer :tag_id
      t.integer :push_user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :p_user_tags
  end
end
