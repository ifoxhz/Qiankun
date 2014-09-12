Qiankun::Wuye.controllers :rooms do
layout Padrino.root("app","views","application.haml")
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :index do
    @title = "Rooms"
    @rooms = Room.all
    render 'rooms/index'
  end

  get :room_list ,:map=>"/rooms/room_list/:building_id" do 
   @building=Building.find(params[:building_id])
   @area=Area.find(@building.area_id)
   @rooms=Room.where(:building_id=>params[:building_id])
   render 'rooms/index'
  end

  get :new,:map=>"rooms/new/:building_id" do
    @title = pat(:new_title, :model => 'room')
    @building=Building.find(params[:building_id])
    @areas=Area.find(@building.area_id)
    @room = Room.new
    render 'rooms/new'
  end

  post :create do
    @room = Room.new(params[:room])
    if @room.save
      @title = pat(:create_title, :model => "room #{@room.id}")
      flash[:success] = pat(:create_success, :model => 'Room')
      params[:save_and_continue] ? redirect(url(:rooms, :index)) : redirect(url(:rooms, :edit, :id => @room.id))
    else
      @title = pat(:create_title, :model => 'room')
      flash.now[:error] = pat(:create_error, :model => 'room')
      render 'rooms/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "room #{params[:id]}")
    @room = Room.find(params[:id])
    if @room
      render 'rooms/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'room', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "room #{params[:id]}")
    @room = Room.find(params[:id])
    if @room
      if @room.update_attributes(params[:room])
        flash[:success] = pat(:update_success, :model => 'Room', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:rooms, :index)) :
          redirect(url(:rooms, :edit, :id => @room.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'room')
        render 'rooms/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'room', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Rooms"
    room = Room.find(params[:id])
    if room
      if room.destroy
        flash[:success] = pat(:delete_success, :model => 'Room', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'room')
      end
      redirect url(:rooms, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'room', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Rooms"
    unless params[:room_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'room')
      redirect(url(:rooms, :index))
    end
    ids = params[:room_ids].split(',').map(&:strip)
    rooms = Room.find(ids)
    
    if Room.destroy rooms
    
      flash[:success] = pat(:destroy_many_success, :model => 'Rooms', :ids => "#{ids.to_sentence}")
    end
    redirect url(:rooms, :index)
  end

end
