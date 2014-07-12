class CreateRoomCars < ActiveRecord::Migration
  def self.up
    create_table :room_cars do |t|
      t.string :cartype
      t.string :brand
      t.string :number
      t.string :color
      t.integer :room_id
      t.timestamps
    end
  end

  def self.down
    drop_table :room_cars
  end
end
