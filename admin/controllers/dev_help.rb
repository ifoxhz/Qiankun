Qiankun::Admin.controllers :dev_help do
set :markdown, :layout_engine => :haml#, :layout => :application
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
  
  get :um_help do
    #puts File.read(Padrino.root("admin","views","dev_help","hunter.markdown"))
   # markdown File.read(Padrino.root("admin","views","dev_help","hunter.markdown")),:layout=>Padrino.root("admin","views","application.haml")
    #markdown = RDiscount.new(File.read(Padrino.root("admin","views","dev_help","hunter.markdown")))
    #@markdown=markdown.to_html.gsub('"',"")
    render 'dev_help/um_helper'

  end

  get :meeting do 
    @title="Meeting"
    render 'dev_help/meeting'
  end

  get :dev_resouces do
    @title="tips-dev-resources"
    render 'dev_help/dev_resouces'
  end

  get :heroku do
    @title="tips-heroku"
    render 'dev_help/heroku'
  end

  get :best_practice do
    @title="tips-bestpractice"
    render 'dev_help/best_practice'
  end

    get :ruby_gc do
    @title="tips-rubygc"
    render 'dev_help/ruby_gc'
  end



end
