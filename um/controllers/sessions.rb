Qiankun::Um.controllers :sessions do
  layout Padrino.root("app","views","application.haml")
  #register Padrino::Admin::Helpers::ViewHelpers
  get :new do
    render "/sessions/new", nil, :layout => false
  end

  post :create do
    if account = User.authenticate(params[:email], params[:password])
      set_current_account(account)
     # redirect url(:base, :index)
       redirect Qiankun::App.url(:base, :index)
    elsif Padrino.env == :development && params[:bypass]
      account = User.first
      set_current_account(account)
      redirect Qiankun::App.url(:base, :index)
    else
      params[:email] = h(params[:email])
      flash.now[:error] = pat('login.error')
      render "/sessions/new", nil, :layout => false
    end
  end

  delete :destroy do
    set_current_account(nil)
    redirect url(:sessions, :new)
  end
end
