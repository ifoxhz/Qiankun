Qiankun::Admin.controllers :room_owners do
  get :index do
    @title = "Room_owners"
    @room_owners = RoomOwner.all
    render 'room_owners/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'room_owner')
    @room_owner = RoomOwner.new
    render 'room_owners/new'
  end

  post :create do
    @room_owner = RoomOwner.new(params[:room_owner])
    if @room_owner.save
      @title = pat(:create_title, :model => "room_owner #{@room_owner.id}")
      flash[:success] = pat(:create_success, :model => 'RoomOwner')
      params[:save_and_continue] ? redirect(url(:room_owners, :index)) : redirect(url(:room_owners, :edit, :id => @room_owner.id))
    else
      @title = pat(:create_title, :model => 'room_owner')
      flash.now[:error] = pat(:create_error, :model => 'room_owner')
      render 'room_owners/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "room_owner #{params[:id]}")
    @room_owner = RoomOwner.find(params[:id])
    if @room_owner
      render 'room_owners/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'room_owner', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "room_owner #{params[:id]}")
    @room_owner = RoomOwner.find(params[:id])
    if @room_owner
      if @room_owner.update_attributes(params[:room_owner])
        flash[:success] = pat(:update_success, :model => 'Room_owner', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:room_owners, :index)) :
          redirect(url(:room_owners, :edit, :id => @room_owner.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'room_owner')
        render 'room_owners/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'room_owner', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Room_owners"
    room_owner = RoomOwner.find(params[:id])
    if room_owner
      if room_owner.destroy
        flash[:success] = pat(:delete_success, :model => 'Room_owner', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'room_owner')
      end
      redirect url(:room_owners, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'room_owner', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Room_owners"
    unless params[:room_owner_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'room_owner')
      redirect(url(:room_owners, :index))
    end
    ids = params[:room_owner_ids].split(',').map(&:strip)
    room_owners = RoomOwner.find(ids)
    
    if RoomOwner.destroy room_owners
    
      flash[:success] = pat(:destroy_many_success, :model => 'Room_owners', :ids => "#{ids.to_sentence}")
    end
    redirect url(:room_owners, :index)
  end
end
