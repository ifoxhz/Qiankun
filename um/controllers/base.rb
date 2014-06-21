Qiankun::Um.controllers :base do
  get :index, :map => "/" do
    render "base/index"
  end

  get :bootstrap do 
  render "base/boostrap"
  end
end
