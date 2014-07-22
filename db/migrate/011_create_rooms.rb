class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.string :number #房间号 201
      t.integer :floor  #楼层 2楼
      t.integer :building_id #属于那一栋
      t.boolean :saled#是否已经销售
      t.string :chan_quan#产权如50年，70年
      t.string :huxing#三室一厅
      t.string :structure#混砖结构
      t.float :square#房屋面积
      t.string :idles_tatus#是否空闲
      t.string :rents_tatus#是否出租
      t.string :zhuangxiu_status#是否已经装修
      t.string :start_date#入住时间
      t.integer :area_id
      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
