Qiankun::Um.controllers :base do
 enable  :reload # enabled in all environments
  get :index, :map => "/" do
    render "base/index"
  end
end
