require 'rest_client'
RestClient.proxy="http://10.144.1.10:8080"

#push message


def push_msg()
	puts RestClient.get "http://www.baidu.com"
end

if $0==__FILE__
	push_msg
end
