class CreateNodes < ActiveRecord::Migration
  def self.up
    create_table :nodes do |t|
      t.string :name
      t.integer :number
      t.string :nodetype
      t.integer :created_by
      t.timestamps
    end
  end

  def self.down
    drop_table :nodes
  end
end
