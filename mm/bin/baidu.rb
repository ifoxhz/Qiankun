require 'rest_client'
require 'digest'


#u计算baid URL中MD5的函数，按照百度的要求
def get_md5_string(url,http_method,query_hash,secret_key)
	md5_string=""

	md5_string<<http_method
	md5_string<<url
	query_hash.sort_by {|key,value| key}.each do |kv_pair|
		md5_string<<"#{kv_pair[0]}=#{kv_pair[1]}"
	end
	md5_string<<secret_key
	md5_string
end

def query_bindlist(apikey,secret_key,user_id,channel_id)

baidu_url="http://channel.api.duapp.com/rest/2.0/channel/#{channel_id}"
method="query_bindlist"
http_method="POST"

query_hash={"apikey" => 'GTlsskbUF3zs5WH9rR6EffS4',\
"timestamp"=>Time.now.to_i,"user_id"=>user_id,"channel_id"=>channel_id,"method"=>method}
#puts Digest::MD5.hexdigest("hi")
md5_string=get_md5_string(baidu_url,http_method,query_hash,secret_key)
md5_sign=Digest::MD5.hexdigest(CGI::escape(md5_string))
puts "md5_sign=#{md5_sign}"
query_hash["sign"]=md5_sign
puts RestClient.post baidu_url,query_hash
end


def uni_push_msg(apikey,secret_key,user_id,channel_id,msg)
	baidu_url="http://channel.api.duapp.com/rest/2.0/channel/#{channel_id}"
	method="push_msg"
	http_method="POST"
    query_hash={"apikey" => 'GTlsskbUF3zs5WH9rR6EffS4',\
   "timestamp"=>Time.now.to_i,"user_id"=>user_id,\
   "channel_id"=>channel_id,"method"=>method,\
   "push_type"=>1,"messages"=>msg,\
    "msg_keys"=>"testkeys"}

	md5_string=get_md5_string(baidu_url,http_method,query_hash,secret_key)
	md5_sign=Digest::MD5.hexdigest(CGI::escape(md5_string))
	puts "md5_sign=#{md5_sign}"
	query_hash["sign"]=md5_sign
	puts RestClient.post baidu_url,query_hash
end

if $0==__FILE__
    
    user_id="1120552505179199052"
	channel_id="3556089571213720011"
	apikey = 'GTlsskbUF3zs5WH9rR6EffS4'
	secret_key="x9p3y2L4kAidrzER5T71Esg2tch6z8Rf"
	msg="Hi, this is from our server's message"
	query_bindlist(apikey,secret_key,user_id,channel_id)
    uni_push_msg(apikey,secret_key,user_id,channel_id,msg)
end

