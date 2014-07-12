Qiankun::Admin.controllers :room_billings do
  get :index do
    @title = "Room_billings"
    @room_billings = RoomBilling.all
    render 'room_billings/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'room_billing')
    @room_billing = RoomBilling.new
    render 'room_billings/new'
  end

  post :create do
    @room_billing = RoomBilling.new(params[:room_billing])
    if @room_billing.save
      @title = pat(:create_title, :model => "room_billing #{@room_billing.id}")
      flash[:success] = pat(:create_success, :model => 'RoomBilling')
      params[:save_and_continue] ? redirect(url(:room_billings, :index)) : redirect(url(:room_billings, :edit, :id => @room_billing.id))
    else
      @title = pat(:create_title, :model => 'room_billing')
      flash.now[:error] = pat(:create_error, :model => 'room_billing')
      render 'room_billings/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "room_billing #{params[:id]}")
    @room_billing = RoomBilling.find(params[:id])
    if @room_billing
      render 'room_billings/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'room_billing', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "room_billing #{params[:id]}")
    @room_billing = RoomBilling.find(params[:id])
    if @room_billing
      if @room_billing.update_attributes(params[:room_billing])
        flash[:success] = pat(:update_success, :model => 'Room_billing', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:room_billings, :index)) :
          redirect(url(:room_billings, :edit, :id => @room_billing.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'room_billing')
        render 'room_billings/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'room_billing', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Room_billings"
    room_billing = RoomBilling.find(params[:id])
    if room_billing
      if room_billing.destroy
        flash[:success] = pat(:delete_success, :model => 'Room_billing', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'room_billing')
      end
      redirect url(:room_billings, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'room_billing', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Room_billings"
    unless params[:room_billing_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'room_billing')
      redirect(url(:room_billings, :index))
    end
    ids = params[:room_billing_ids].split(',').map(&:strip)
    room_billings = RoomBilling.find(ids)
    
    if RoomBilling.destroy room_billings
    
      flash[:success] = pat(:destroy_many_success, :model => 'Room_billings', :ids => "#{ids.to_sentence}")
    end
    redirect url(:room_billings, :index)
  end
end
