Qiankun::Org.controllers :organizes do
  
  layout Padrino.root("app","views","application.haml")
  get :index do
    @title = "Organizes"
    @organizes = Organize.all
    render 'organizes/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'organize')
    @organize = Organize.new
    render 'organizes/new'
  end

 get :my_org, :map=>"/organizes/my_org" do

 if session[:user_id]
   @my_org=Organize.where(:user_id=>session[:user_id]).first #curent only support on org
else
  @my_org=nil
end
   render "organizes/my_org"
 end

  post :create do

    params[:organize][:user_id]=session[:user_id]
    
    @organize = Organize.new(params[:organize])
    if @organize.save
      @title = pat(:create_title, :model => "organize #{@organize.id}")
      flash[:success] = pat(:create_success, :model => 'Organize')
      params[:save_and_continue] ? redirect(url(:organizes, :index)) : redirect(url(:organizes, :edit, :id => @organize.id))
    else
      @title = pat(:create_title, :model => 'organize')
      flash.now[:error] = pat(:create_error, :model => 'organize')
      render 'organizes/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "organize #{params[:id]}")
    @organize = Organize.find(params[:id])
    if @organize
      render 'organizes/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'organize', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "organize #{params[:id]}")
    @organize = Organize.find(params[:id])
    if @organize
      if @organize.update_attributes(params[:organize])
        flash[:success] = pat(:update_success, :model => 'Organize', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:organizes, :index)) :
          redirect(url(:organizes, :edit, :id => @organize.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'organize')
        render 'organizes/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'organize', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Organizes"
    organize = Organize.find(params[:id])
    if organize
      if organize.destroy
        flash[:success] = pat(:delete_success, :model => 'Organize', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'organize')
      end
      redirect url(:organizes, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'organize', :id => "#{params[:id]}")
      halt 404
    end
  end

end
