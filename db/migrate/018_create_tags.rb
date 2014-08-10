class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :p_tag
      t.string :sv_tag
      t.string :b_key
      t.integer :owner_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end
