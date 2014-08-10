require 'rest_client'

def test_get_user_list(host,api_key)


	url="http://#{host}/api/apiv1/all_user/"

	query_hash={"apikey" => api_key}

	a=RestClient.get url,{:params => query_hash}
	puts a
end

if $0==__FILE__

	host="localhost:3000"
	api_key="GTlsskbUF3zs5WH9rR6EffS4"

	test_get_user_list(host,api_key)

end
