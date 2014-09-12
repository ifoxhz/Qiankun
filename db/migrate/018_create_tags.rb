#该表建立百度的tag名字和我们系统的tag名字的对应表
#问题，为何要建立自己的标签系统？唯一的担心就是百度的标签可读性不好，或者我们需要一个可读的标签名字
#实际中，标签的编号可能会有一定的规律， 如物业企业的标签可能普遍带有wuye_qiye_*, wuye_custermer_*

class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :p_tag #百度的tag
      t.string :sv_tag#服务的tag
      t.string :apikey #百度的服务API
      t.integer :owner_id #拥有的tag
      t.integer :user_id  #谁创建的
      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end
