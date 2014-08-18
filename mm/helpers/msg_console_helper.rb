# Helper methods defined here can be accessed in any controller or view in the application

module Qiankun
  class Mm
    module MsgConsoleHelper

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

	def get_all_user
		puts "hi"
	end


	def uni_push_msg(apikey,secret_key,user_id,channel_id,msg,push_type)

		baidu_url="http://channel.api.duapp.com/rest/2.0/channel/#{channel_id}"
		method="push_msg"
		http_method="POST"

	    message={
	    	    "tag"=>"",
			    "nick"=>"",
			    "head_id"=>"",
			    "user_id"=>"",
			    "time_samp"=>Time.now.to_i,
			    "message"=> msg.force_encoding("UTF-8"),
			    "channel_id"=>""
			    }.to_s



	    query_hash={"apikey" => apikey,\
	   "timestamp"=>Time.now.to_i,"user_id"=>user_id,\
	   "channel_id"=>channel_id,"method"=>method,\
	   "push_type"=>push_type.to_i,"messages"=>message,\
	    "msg_keys"=>"testkeys","message_type"=>0}
     
		md5_string=get_md5_string(baidu_url,http_method,query_hash,secret_key)
		md5_sign=Digest::MD5.hexdigest(CGI::escape(md5_string))
		puts "md5_sign=#{md5_sign}"
		query_hash["sign"]=md5_sign

		#RestClient.proxy = "http://10.144.1.10:8080"
		a=RestClient.post baidu_url,query_hash
		return a
	end

    end

    helpers MsgConsoleHelper
  end
end
