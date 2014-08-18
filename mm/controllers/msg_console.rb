Qiankun::Mm.controllers :msg_console do
  layout Padrino.root("app","views","application.haml")
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
  
  get :list_all_user do
    @all_user=PushUser.all
    render 'msg_console/list_all_user'
  end


  get :message_new ,:map=>"/message_new/:pu_id/:pc_id" do
    @puser=PushUser.where(:apikey=>Settings.api_key,:pu_id=>params[:pu_id],:pc_id=>params[:pc_id]).first
    render 'msg_console/message_new'
  end


  post :send_msg do

   @all_user=PushUser.all

    uni_push_msg(Settings.api_key,Settings.secret_key,params["pu_id"],params["pc_id"],params["text_msg"],params["push_type"])
    render 'msg_console/list_all_user'

  end

end
