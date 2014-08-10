Padrino.require_dependencies(Padrino.root('api/ping.rb'))

module Qiankun
 module Api
    class Ping < Grape::API   

      format :json
      get '/ping' do
        { ping: "128#{User.count}" }
      end
    end
end
end