class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.string :name#管理处名称
      t.float :lx#精度和纬度，我们可以在后台帮助用户填写
      t.float :ly
      t.string :address#物业地址
      t.string :number #我们给他们分配一个编号
      t.integer :organize_id #可以和组织id对应，或许可以用于群组关系的建设
      t.integer :user_id#创建者
      t.timestamps
    end
  end

  def self.down
    drop_table :areas
  end
end
