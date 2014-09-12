Qiankun::Api.controllers :apiv1 do

  get 'get_sv_num' do 

    puser=PushUser.where("apikey"=>params["apikey"],"pu_id"=>params["pu_id"],"pc_id"=>params["pc_id"]).first
    sv_number=""

    if puser.nil? 
      PushUser.last.nil? ? sv_number="1" : sv_number=(PushUser.last.sv_num.to_i+1).to_s
      PushUser.create("apikey"=>params["apikey"],"pu_id"=>params["pu_id"],"pc_id"=>params["pc_id"],"sv_num"=>sv_number)
    else
      sv_number=puser.sv_num
    end

  content_type :json
    { :sv_num => sv_number }.to_json
  end

  get :all_user do   
    all_sv_num=[]
    user_hash=Hash.new
    PushUser.where("apikey"=>params["apikey"]).each do |push_user|
     all_sv_num<<push_user.sv_num
     user_hash[push_user.sv_num]=[push_user.pu_id,push_user.pc_id]
  end
 
  content_type :json
   # { :user_list => all_sv_num}.to_json

   user_hash.to_json
  end

  get :push_msg do
   # secret_key="x9p3y2L4kAidrzER5T71Esg2tch6z8Rf"
   secret_key=Settings.secret_key
    target_user=PushUser.where("sv_num"=>params["sv_num"]).first

    a=uni_push_msg(target_user.apikey,secret_key,target_user.pu_id,target_user.pc_id,params["msg"],params["push_type"])

    content_type :json
    a.to_json
    end

  #end

end
