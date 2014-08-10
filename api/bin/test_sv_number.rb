require 'rest_client'

def test_get_sv_number(host,api_key,pu_id,pc_id)


	url="http://#{host}/api/apiv1/get_sv_num/"

	query_hash={"apikey" => api_key,"pu_id"=>pu_id,"pc_id"=>pc_id}

	a=RestClient.get url,{:params => query_hash}
	puts a
end

if $0==__FILE__

	host="localhost:3000"
	api_key="GTlsskbUF3zs5WH9rR6EffS4"
	pu_id_1="1120552505179199052"
	pc_id_1="3556089571213720011"

	pu_id_2="993713638153685393"
	pc_id_2="3951999432654555679"

	test_get_sv_number(host,api_key,pu_id_1,pc_id_1)
	test_get_sv_number(host,api_key,pu_id_2,pc_id_2)
end

