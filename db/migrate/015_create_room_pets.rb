class CreateRoomPets < ActiveRecord::Migration
  def self.up
    create_table :room_pets do |t|
      t.string :number
      t.string :pinzhong
      t.string :num
      t.integer :room_id
      t.timestamps
    end
  end

  def self.down
    drop_table :room_pets
  end
end
