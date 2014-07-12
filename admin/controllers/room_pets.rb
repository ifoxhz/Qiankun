Qiankun::Admin.controllers :room_pets do
  get :index do
    @title = "Room_pets"
    @room_pets = RoomPet.all
    render 'room_pets/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'room_pet')
    @room_pet = RoomPet.new
    render 'room_pets/new'
  end

  post :create do
    @room_pet = RoomPet.new(params[:room_pet])
    if @room_pet.save
      @title = pat(:create_title, :model => "room_pet #{@room_pet.id}")
      flash[:success] = pat(:create_success, :model => 'RoomPet')
      params[:save_and_continue] ? redirect(url(:room_pets, :index)) : redirect(url(:room_pets, :edit, :id => @room_pet.id))
    else
      @title = pat(:create_title, :model => 'room_pet')
      flash.now[:error] = pat(:create_error, :model => 'room_pet')
      render 'room_pets/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "room_pet #{params[:id]}")
    @room_pet = RoomPet.find(params[:id])
    if @room_pet
      render 'room_pets/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'room_pet', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "room_pet #{params[:id]}")
    @room_pet = RoomPet.find(params[:id])
    if @room_pet
      if @room_pet.update_attributes(params[:room_pet])
        flash[:success] = pat(:update_success, :model => 'Room_pet', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:room_pets, :index)) :
          redirect(url(:room_pets, :edit, :id => @room_pet.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'room_pet')
        render 'room_pets/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'room_pet', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Room_pets"
    room_pet = RoomPet.find(params[:id])
    if room_pet
      if room_pet.destroy
        flash[:success] = pat(:delete_success, :model => 'Room_pet', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'room_pet')
      end
      redirect url(:room_pets, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'room_pet', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Room_pets"
    unless params[:room_pet_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'room_pet')
      redirect(url(:room_pets, :index))
    end
    ids = params[:room_pet_ids].split(',').map(&:strip)
    room_pets = RoomPet.find(ids)
    
    if RoomPet.destroy room_pets
    
      flash[:success] = pat(:destroy_many_success, :model => 'Room_pets', :ids => "#{ids.to_sentence}")
    end
    redirect url(:room_pets, :index)
  end
end
