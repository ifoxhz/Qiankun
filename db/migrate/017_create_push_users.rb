#建立单独的一张管理百度用户的表格
#一个用户帐号，或许有几个百度的id

class CreatePushUsers < ActiveRecord::Migration
  def self.up
    create_table :push_users do |t|
      t.string :pu_id #用户的百度 user_id
      t.string :pc_id # 用户的channel_id
      t.string :apikey #用户的API key
      t.string :sv_num #用户内部服务号全局唯一
      t.integer :user_id#用户的内部帐号id
      t.timestamps
    end
  end

  def self.down
    drop_table :push_users
  end
end
