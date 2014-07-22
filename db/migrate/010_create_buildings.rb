class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :number  #楼号
      t.integer :unitnum #单元号
      t.integer :numperunit #物业数，每个单元的
      t.integer :floornum #有多少层
      t.string :first_num #一楼的房间编号，以，相隔
      t.string :elevator#有无电梯
      t.integer :area_id #属于哪个管理区
      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
