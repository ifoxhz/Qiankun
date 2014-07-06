Qiankun::App.controllers :dev_help do
 # layout Padrino.root("app","views","application.haml")
#set :markdown, :layout_engine => :haml#, :layout => :application
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

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
  
  get :index do
    @title="dev_help"
    render '/dev_help/index'
  end

  get :meeting do 
    @title="Meeting"
    render '/dev_help/meeting'
  end

  get :dev_resource do
    @title="tips-dev-resources"
    render '/dev_help/dev_resource'
  end

  get :heroku do
    @title="tips-heroku"
    render '/dev_help/heroku'
  end

  get :best_practice do
    @title="tips-bestpractice"
    render '/dev_help/best_practice'
  end

  get :ruby_gc do
    @title="tips-rubygc"
    render '/dev_help/ruby_gc'
    end
  get :product_line do
    @title="tips-rubygc"
    render '/dev_help/product_line'
  end



end
