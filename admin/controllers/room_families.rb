Qiankun::Admin.controllers :room_families do
  get :index do
    @title = "Room_families"
    @room_families = RoomFamily.all
    render 'room_families/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'room_family')
    @room_family = RoomFamily.new
    render 'room_families/new'
  end

  post :create do
    @room_family = RoomFamily.new(params[:room_family])
    if @room_family.save
      @title = pat(:create_title, :model => "room_family #{@room_family.id}")
      flash[:success] = pat(:create_success, :model => 'RoomFamily')
      params[:save_and_continue] ? redirect(url(:room_families, :index)) : redirect(url(:room_families, :edit, :id => @room_family.id))
    else
      @title = pat(:create_title, :model => 'room_family')
      flash.now[:error] = pat(:create_error, :model => 'room_family')
      render 'room_families/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "room_family #{params[:id]}")
    @room_family = RoomFamily.find(params[:id])
    if @room_family
      render 'room_families/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'room_family', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "room_family #{params[:id]}")
    @room_family = RoomFamily.find(params[:id])
    if @room_family
      if @room_family.update_attributes(params[:room_family])
        flash[:success] = pat(:update_success, :model => 'Room_family', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:room_families, :index)) :
          redirect(url(:room_families, :edit, :id => @room_family.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'room_family')
        render 'room_families/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'room_family', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Room_families"
    room_family = RoomFamily.find(params[:id])
    if room_family
      if room_family.destroy
        flash[:success] = pat(:delete_success, :model => 'Room_family', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'room_family')
      end
      redirect url(:room_families, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'room_family', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Room_families"
    unless params[:room_family_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'room_family')
      redirect(url(:room_families, :index))
    end
    ids = params[:room_family_ids].split(',').map(&:strip)
    room_families = RoomFamily.find(ids)
    
    if RoomFamily.destroy room_families
    
      flash[:success] = pat(:destroy_many_success, :model => 'Room_families', :ids => "#{ids.to_sentence}")
    end
    redirect url(:room_families, :index)
  end
end
