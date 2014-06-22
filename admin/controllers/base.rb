Qiankun::Admin.controllers :base do
  enable  :reload # enabled in all environments
  layout Padrino.root("app","views","application.haml")
  get :index, :map => "/" do
    render "base/index"
  end
end
