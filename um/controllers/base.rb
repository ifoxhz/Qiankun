Qiankun::Um.controllers :base do
  layout Padrino.root("app","views","application.haml")
  get :index, :map => "/" do
    render "base/index"
  end

#get :login  do 
#	if session[:user_id].nil?
#	 redirect Qiankun::Um.url(:sessions, :new)
#	end
#end
  get :bootstrap do 
  render "base/boostrap"
  end
end
