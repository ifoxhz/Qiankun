class CreateRoomFamilies < ActiveRecord::Migration
  def self.up
    create_table :room_families do |t|
      t.string :name
      t.integer :room_id
      t.string :relation
      t.integer :age
      t.string :sex
      t.string :workplace
      t.string :title
      t.string :mphone
      t.timestamps
    end
  end

  def self.down
    drop_table :room_families
  end
end
