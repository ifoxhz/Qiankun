# Seed add you the ability to populate your db.
# We provide you a basic shell for interaction with the end user.
# So try some code like below:
#
#   name = shell.ask("What's your name?")
#   shell.say name
#
#email     = shell.ask "Which email do you want use for logging into admin?"
#password  = shell.ask "Tell me the password to use:"
email="admin@qiankun.com"
password="lanshan"
#shell.say ""

# remove shell interactive, just use fixed password
if Account.count == 0
  account = Account.create(:email => email, :name => "Foo", :surname => "Bar", :password => password, :password_confirmation => password, :role => "admin")
end

if User.count ==0 || User.where(:email=>"hunter.hu@nsn.com").count==0
   account = User.create(:email => "hunter.hu@nsn.com", :name => "Hunter",:password => password, :password_confirmation => password, :role => "admin")
   account = User.create(:email => "zhengyong@gmail.com", :name => "ZhengYong",:password => password, :password_confirmation => password, :role => "admin")
   account = User.create(:email => "eric.xia@nsn.com", :name => "XiaMingMing",:password => password, :password_confirmation => password, :role => "admin")

end


#Hunter's seed
Area.delete_all
Building.delete_all

hunter=User.where(:email=>"hunter.hu@nsn.com").first
hunter_area=Area.where(:user_id=>hunter.id).first
puts "hunter-area=#{hunter_area.nil?}"
if hunter_area.nil?
  #build area
  hunter_area=Area.create(:name=>"世贸之西湖",:address=>"江南大道001号",:user_id=>hunter.id,:number=>"001")
  #build building
  1.upto(10).each do |i|
    Building.create(:area_id=>hunter_area.id,:number=>i,:unitnum=>3,:floornum=>18,:numperunit=>2,:elevator=>true,:first_num=>"01~02")
  end
  #build room for each building
Building.all.each do |building|
 1.upto(building.unitnum).each do |i|
  1.upto(building.floornum).each do |j|
    building.first_num.split("~").each do |k|
    room_number="#{building.number}-#{i}-#{j}#{k}"
    puts "building id =#{building.id}"
    Room.create(:number=>room_number,:building_id=>building.id,:saled=>true,:chan_quan=>"70",:huxing=>"三室二厅两卫",:square=>123.35,:idles_tatus=>"true",:rents_tatus=>"false",:start_date=>"2012-01-01",:area_id=>hunter_area.id)
  end
 end
end
end
end


