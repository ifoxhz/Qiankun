Qiankun::Wuye.controllers :dev_plan do
  
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


  get :phase1  do
    render 'dev_plan/phase1'
  end

  get :phase2  do
    render 'dev_plan/phase2'
  end

end
