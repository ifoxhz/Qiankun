class Building < ActiveRecord::Base
  validates :number, presence: true
  validates :unitnum, presence: true
  validates :numperunit, presence: true
  validates :floornum, presence: true
  validates :first_num, presence: true
  validates :elevator, presence: true

end
