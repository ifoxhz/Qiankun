class CreateRoomBillings < ActiveRecord::Migration
  def self.up
    create_table :room_billings do |t|
      t.string :name  #物业费
      t.string :start_date #收取开始时间
      t.string :end_date#收取结束时间
      t.string :receipt_num# 收据或者发票号
      t.integer :month_num #收取月份
      t.integer :year_num #收取年份
      t.float :unit_fee #单位价格
      t.float :total_pay #全部需要支付的
      t.float :count #折扣
      t.string :status # 账单状态
      t.string :receipt_photo #发票照片
      t.string :admin_person #管理人员
      t.timestamps
    end
  end

  def self.down
    drop_table :room_billings
  end
end
