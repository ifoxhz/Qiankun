class CreateRoomOwners < ActiveRecord::Migration
  def self.up
    create_table :room_owners do |t|
      t.string :name
      t.string :sex
      t.integer :room_id
      t.integer :family_num
      t.string :id_num
      t.string :workplace
      t.string :title
      t.string :mphone
      t.string :emergency_phone
      t.timestamps
    end
  end

  def self.down
    drop_table :room_owners
  end
end
