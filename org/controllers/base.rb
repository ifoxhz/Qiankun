Qiankun::Org.controllers :base do
  #layout Padrino.root("app","views","application.haml")
 # set :layout,  Qiankun::App.layout(:application)
 #layout Qiankun::Admin.layout_path("application.haml")
 #puts Padrino.root("app","views","layouts","application.haml")
#set :layout=>Padrino.root("app","views","layouts","application.haml")


   get :index, :map => '/' do
  #   session[:foo] = 'bar'
     render 'base/index',:layout=>Qiankun::App.layout_path("application")
   end


  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  

end
