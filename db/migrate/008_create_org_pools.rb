class CreateOrgPools < ActiveRecord::Migration
  def self.up
    create_table :org_pools do |t|
      t.organizeid :integer
      t.userid :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :org_pools
  end
end
