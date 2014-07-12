Qiankun::Admin.controllers :room_cars do
  get :index do
    @title = "Room_cars"
    @room_cars = RoomCar.all
    render 'room_cars/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'room_car')
    @room_car = RoomCar.new
    render 'room_cars/new'
  end

  post :create do
    @room_car = RoomCar.new(params[:room_car])
    if @room_car.save
      @title = pat(:create_title, :model => "room_car #{@room_car.id}")
      flash[:success] = pat(:create_success, :model => 'RoomCar')
      params[:save_and_continue] ? redirect(url(:room_cars, :index)) : redirect(url(:room_cars, :edit, :id => @room_car.id))
    else
      @title = pat(:create_title, :model => 'room_car')
      flash.now[:error] = pat(:create_error, :model => 'room_car')
      render 'room_cars/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "room_car #{params[:id]}")
    @room_car = RoomCar.find(params[:id])
    if @room_car
      render 'room_cars/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'room_car', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "room_car #{params[:id]}")
    @room_car = RoomCar.find(params[:id])
    if @room_car
      if @room_car.update_attributes(params[:room_car])
        flash[:success] = pat(:update_success, :model => 'Room_car', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:room_cars, :index)) :
          redirect(url(:room_cars, :edit, :id => @room_car.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'room_car')
        render 'room_cars/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'room_car', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Room_cars"
    room_car = RoomCar.find(params[:id])
    if room_car
      if room_car.destroy
        flash[:success] = pat(:delete_success, :model => 'Room_car', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'room_car')
      end
      redirect url(:room_cars, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'room_car', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Room_cars"
    unless params[:room_car_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'room_car')
      redirect(url(:room_cars, :index))
    end
    ids = params[:room_car_ids].split(',').map(&:strip)
    room_cars = RoomCar.find(ids)
    
    if RoomCar.destroy room_cars
    
      flash[:success] = pat(:destroy_many_success, :model => 'Room_cars', :ids => "#{ids.to_sentence}")
    end
    redirect url(:room_cars, :index)
  end
end
