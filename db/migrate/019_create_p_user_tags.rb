#用户和标签的多对多的关系表
#用户可能有多个标签 ，一个标签可能有多个用户，这就是为何需要建立维护这个多对多的表格
#
class CreatePUserTags < ActiveRecord::Migration
  def self.up
    create_table :p_user_tags do |t|
      t.string :pu_id #用户的百度user_id
      t.string :pc_id #用户在百度的channnel ID
      t.string :apikey #API key
      t.string :tag #用户的其中一个tag
      t.integer :tag_id #用户的tag标签索引
      t.integer :push_user_id #用户的推送用户的id
      t.timestamps
    end
  end

  def self.down
    drop_table :p_user_tags
  end
end
