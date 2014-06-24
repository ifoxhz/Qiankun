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

if account.valid?
  shell.say "================================================================="
  shell.say "Account has been successfully created, now you can login with:"
  shell.say "================================================================="
  shell.say "   email: #{email}"
  shell.say "   password: #{password}"
  shell.say "================================================================="
else
  shell.say "Sorry but some thing went wrong!"
  shell.say ""
  account.errors.full_messages.each { |m| shell.say "   - #{m}" }
end

shell.say ""
