Qiankun::Admin.controllers :base do
  #enable  :reload # enabled in all environments
  get :index, :map => "/" do
  	puts "hi , this is index"
    render "base/index"
   end
end
