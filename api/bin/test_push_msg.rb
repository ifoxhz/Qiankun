require 'rest_client'

def test_push_msg(host,api_key,pu_id,pc_id,sv_num,msg,push_type)


	url="http://#{host}/api/apiv1/push_msg/"

	query_hash={"apikey" => api_key,"pu_id"=>pu_id,"pc_id"=>pc_id,"sv_num"=>sv_num,"push_type"=>push_type,"msg"=>msg}

	a=RestClient.get url,{:params => query_hash}
	puts a
end

if $0==__FILE__

	#host="121.40.139.187:3000"
	host="localhost:3000"
	api_key="GTlsskbUF3zs5WH9rR6EffS4"
	pu_id_1="1120552505179199052"
	pc_id_1="3556089571213720011"

	pu_id_2="993713638153685393"
	pc_id_2="3951999432654555679"

    push_type=1
	test_push_msg(host,api_key,pu_id_1,pc_id_1,"2","hi from user SDK 2",push_type)
	test_push_msg(host,api_key,pu_id_2,pc_id_2,"001","Hi from samsumg 2 ",push_type)
end

