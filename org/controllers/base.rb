Qiankun::Org.controllers :base do

   layout Padrino.root("app","views","application.haml")
   get :index, :map => '/' do
     render 'base/index'

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
