class CreateOrgPools < ActiveRecord::Migration
  def self.up
    create_table :org_pools do |t|
      t.integer :organize_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :org_pools
  end
end
